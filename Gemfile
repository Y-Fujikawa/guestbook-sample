source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.3.20'
# Use slim for views
gem 'slim-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# User Authorization
gem 'devise'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'bower-rails'

# Use unicorn as the app server
group :staging, :production do
  gem 'unicorn'
end

# Use Capistrano for deployment
group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # deploy
  gem 'capistrano', '~> 3.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'
  gem 'capistrano-rbenv'
  gem 'capistrano-maintenance', '~> 1.0', require: false

  gem 'pry-rails'

  # convert erb to slim
  gem 'html2slim'

		# Local Mail Test
		gem 'mailcatcher'
end

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'bootstrap-sass-rails'
gem 'bootstrap_form'
gem 'icheck-rails'
gem 'font-awesome-sass'
gem 'kaminari'
gem 'therubyracer'
gem 'dotenv-rails'
