# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'guestbook-sample'
set :repo_url, 'git@github.com:Y-Fujikawa/guestbook-sample.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/guestbook-sample'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets}

# Default value for default_env is {}
set :default_env, {
  rbenv_root: "/usr/local/rbenv",
 path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH"
}

# Default value for keep_releases is 5
set :keep_releases, 5

# Unicorn周りの設定をする
set :unicorn_rack_env, "none"
set :unicorn_config_path, 'config/unicorn.rb'

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
