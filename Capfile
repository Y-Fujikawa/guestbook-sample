# Load DSL and Setup Up Stages
# Capistranoの設定を読み込む。おまじない
require 'capistrano/setup'

# Includes default deployment tasks
# デプロイフレームワークを読み込み
require 'capistrano/deploy'

# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
require 'capistrano/rbenv'
set :rbenv_type, :system
set :rbenv_ruby, '2.2.0'

# deploy:updated の前に bundle install してくれる
require 'capistrano/bundler'
# cap3で unicorn を操作できるようにしてくれる
require 'capistrano3/unicorn'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
# Capistrano3でメンテナンスモードにする
require 'capistrano/maintenance'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
# `lib/capistrano/tasks' に定義されたタスクを読み込む
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
