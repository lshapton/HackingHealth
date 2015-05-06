source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# Use sqlite3 as the database for Active Record
group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'annotate'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  # gem 'foreigner'
  # gem 'seed_dump'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'faker'
end


gem 'pry-rails'

# model layer
gem 'ranked-model'
gem 'devise'
gem 'paperclip'
gem 'aws-sdk', '~> 1.5.7'
gem 'friendly_id', '~> 5.0.0'
gem 'roo'

gem 'paper_trail', '~> 3.0.5'

# view stuff
# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'jquery-datatables-rails'
gem 'bootstrap-sass'
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
gem 'eco'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use mixpanel for analytics
# require 'mixpanel-ruby'

 gem 'unicorn'
