# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.1.0'

gem 'rails', '~> 7.1.1'

gem 'sprockets-rails'

gem 'pg', '~> 1.1'

gem 'puma', '>= 5.0'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'cssbundling-rails'

gem 'jbuilder'

gem 'redis', '>= 4.0.1'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

gem 'tzinfo-data', platforms: %i[mswin mswin64 mingw x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem 'debug', platforms: %i[mri mswin mswin64 mingw x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  gem 'error_highlight', '>= 0.4.0', platforms: [:ruby]
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
