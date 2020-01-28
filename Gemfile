# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'sqlite3', '~> 1.4'
  gem 'rubocop', '~> 0.79.0'
  gem 'dotenv-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  gem 'launchy', '~> 2.4', '>= 2.4.3'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'factory_bot_rails', '~> 4.8.2'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.9'
  gem 'webdrivers'
end

group :production do
  gem 'pg', '~> 1.2', '>= 1.2.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootstrap', '~> 4.0'
gem 'devise', '~> 4.7', '>= 4.7.1'
gem 'rails_admin', '~> 2.0'
gem 'cancancan'
gem 'paper_trail'
