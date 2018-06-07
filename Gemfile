source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'jquery-rails'

#Because this gem is only needed for the Heroku server, we'll add the pg gem in the production environment group.

group :production do
  gem 'pg'
end

#declared inside a development/test block to ensure that it only compiles in the development or test environments
group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 3.6' #for testing in rails 
  gem "factory_bot_rails", "~> 4.0"
end

#for zooming in the product page
gem 'elevatezoom-rails'

#for sending emails through sndgrid 
gem 'sendgrid-ruby'
gem 'devise'
#CanCanCan is an authorization library for Ruby which restricts what resources a given user is allowed to access.
gem 'cancancan', '~> 2.0'
# for pagination purpose...
gem 'will_paginate', '~> 3.1.1'
#The rails-controller-testing gem provides the assigns and assert_template
gem 'rails-controller-testing'
#for payments etc
gem 'stripe'
gem 'dalli'
gem 'redis-rails'