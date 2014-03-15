source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '3.2.14'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'nokogiri'
gem 'pg'
gem 'annotate', ">=2.6.0"
gem 'rake'
gem 'devise'
# skip heroku deployment plugin injection
gem 'rails_12factor'
# brew install git-flow
# brew install elasticsearch
gem 'searchkick'

gem 'haml-rails'
gem 'coffee-rails', '~> 3.2.1'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'foundation-rails'
  gem "active_model_serializers"
  gem 'uglifier', '>= 1.0.3'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :development, :test do
  #gem "minitest", "4.7.5"
  gem 'cucumber-rails', :require => false
  # database_cleaner for cucumber is not required, but highly recommended
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'mocha'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'capybara'
  # faker installed to seed database with testing data
  gem 'faker'
  # gem 'better_errors' # triggers rspec segmentation fault error
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'pry-stack_explorer'

  gem 'quiet_assets'
  gem 'sextant'
end
