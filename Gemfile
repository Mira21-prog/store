source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'
gem 'activeadmin'
gem 'rails', '~> 6.1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'cloudinary', '~> 1.18.1'
gem 'devise', git: 'https://github.com/heartcombo/devise.git', ref: '8bb358cf80a632d3232c3f548ce7b95fd94b6eb2'

gem 'devise_token_auth', github: 'lynndylanhurley/devise_token_auth'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'bootstrap'
gem 'jquery-ui-rails'
gem 'omniauth'
gem 'omniauth-github'
gem 'omniauth-rails_csrf_protection'
gem 'paperclip', '~> 6.0.0'
gem 'will_paginate-bootstrap4'

group :development do
  gem 'pg'
  gem 'web-console', '>= 4.1.0'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'annotate'
  gem 'bootstrap-email'
  gem 'dotenv-rails'
  gem 'letter_opener'
  gem 'pry'
  gem 'spring'
  gem "capistrano"
  gem "capistrano-rvm"
  gem "capistrano-rails"
  gem "capistrano3-puma", github: "seuros/capistrano-puma"
  gem "capistrano-nginx", "~> 1.0"
  gem "capistrano-upload-config"
  gem "sshkit-sudo"
  gem "msgpack", "1.4.2"
end

group :production do
  gem 'mini_magick'
  gem 'pg'
  gem 'rails_12factor', '0.0.2'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
