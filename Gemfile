source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
#gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
 gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


#additional gem
gem 'turbolinks', '~> 5.2'
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'devise', '~> 4.6', '>= 4.6.2'
gem 'devise-i18n', '~> 1.8'
gem 'cancancan', '~> 3.0', '>= 3.0.1'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.5'
#gem 'font-awesome-sass', '~> 5.0.13'

gem 'pg', '~> 1.1', '>= 1.1.4'
gem 'sassc', '~> 2.0', '>= 2.0.1'
gem 'bootstrap', '~> 4.3', '>= 4.3.1'
#gem 'bootstrap-sass', '~> 3.3.7'

gem 'rails-i18n', '~> 5.1', '>= 5.1.3'
gem 'friendly_id', '~> 5.2', '>= 5.2.5'
gem 'premailer-rails', '~> 1.10', '>= 1.10.2'
gem 'remotipart', '~> 1.4', '>= 1.4.2'
#gem 'paperclip', '~> 6.1'
gem 'client_side_validations', '~> 14.1'
gem 'action_mailer_auto_url_options', '~> 1.0', '>= 1.0.2'
gem 'will_paginate-bootstrap', '~> 1.0', '>= 1.0.2'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'chosen-rails', '~> 1.8', '>= 1.8.7'
#gem 'apartment', '~> 2.2'
gem 'chartkick', '~> 3.0', '>= 3.0.2'
gem 'cocoon', '~> 1.2', '>= 1.2.12'
#gem 'ckeditor', '~> 5.0'
gem 'ckeditor', github: 'galetahub/ckeditor'
gem 'social-share-button', '~> 1.2', '>= 1.2.1'
gem 'sanitize', '~> 5.1'
gem 'creek', '~> 2.2'
gem 'pg_search', '~> 2.3'

# For mobile API 
gem 'grape', '~> 1.2', '>= 1.2.5'
gem 'rack-cors', '~> 1.1'
gem 'grape-active_model_serializers', '~> 1.5', '>= 1.5.2'
gem 'devise_token_auth'

# This gem causes db:create to fail
# You can enable it for tests as long as the db has been created
group :production, :staging do
  gem 'active_record_slave'
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.2'
  gem 'annotate', '~> 2.7', '>= 2.7.5'
  gem 'faker', '~> 1.9', '>= 1.9.3'
  gem 'capistrano', '~> 3.10', '>= 3.10.2'
  # For rails requirement
  gem 'capistrano-rails', '~> 1.3', '>= 1.3.1'
  gem 'capistrano-rails-collection', '~> 0.1.0'
  # For rvm
  gem 'capistrano-rvm', '~> 0.1.2'

  # For puma
  gem 'capistrano3-puma', '~> 3.1', '>= 3.1.1'
  #gem 'capistrano3-puma', github: "seuros/capistrano-puma"
end

gem 'pdf-reader', '~> 2.4'
gem 'pdfjs_viewer-rails', '~> 0.3.1'