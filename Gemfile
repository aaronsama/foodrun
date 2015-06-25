source 'https://rubygems.org'
ruby "2.2.0"


gem 'rails', '4.2.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'mysql2'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

group :development do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 3.0'
  gem 'progress_bar'
  gem 'guard-rspec', require: false
  gem 'hirb'
end

group :test do
  gem 'simplecov', :require => false
  gem 'factory_girl_rails', '~> 4.0'
end

group :development, :test do
  gem 'rubocop', require: false
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'spring'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
end