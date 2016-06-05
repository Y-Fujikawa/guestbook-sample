# config valid only for Capistrano 3.4.0
lock '3.4.0'

set :user, 'www'
set :password, 'sample'
set :use_sudo, false

set :application, 'guestbook-sample'
set :repo_url, 'git@github.com:Y-Fujikawa/guestbook-sample.git'
set :branch, ENV['BRANCH'] || "master"

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
set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/secrets.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets vendor/assets/bower_components}

set :bundle_binstubs, -> { shared_path.join('bin') }

# Default value for default_env is {}
set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
  DEVISE_SECRET_KEY: ENV["DEVISE_SECRET_KEY"],
  IMG_UP_AWS_S3_ACCESS_KEY_ID: ENV["IMG_UP_AWS_S3_ACCESS_KEY_ID"],
  IMG_UP_AWS_S3_SECRET_ACCESS_KEY: ENV["IMG_UP_AWS_S3_SECRET_ACCESS_KEY"]
}

# Default value for keep_releases is 5
set :keep_releases, 5

# Unicorn周りの設定をする
set :unicorn_rack_env, "none"
set :unicorn_config_path, 'config/unicorn.rb'

# メンテナンス画面の配置場所
set :maintenance_template_path, "./app/views/maintenance/maintenance.html.erb"

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  desc 'Upload database.yml'
  task :upload do
    on roles(:app) do |host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/database.yml', "#{shared_path}/config/database.yml")
    end
  end

  task :restart do
    invoke 'unicorn:restart'
  end

  before :starting, :upload
end

namespace :bower do
  desc 'Install bower'
  task :install do
    on roles(:web) do
      within release_path do
        execute :rake, 'bower:install'
      end
    end
  end
end
before 'deploy:compile_assets', 'bower:install'
