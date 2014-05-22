source 'https://rubygems.org'

gem 'rails', '4.1.1'
gem 'pg'
gem 'devise'
gem 'simple_form', git: 'https://github.com/plataformatec/simple_form.git', tag: 'v3.1.0.rc1'
gem 'mail_form'
gem 'jbuilder', '~> 2.0'
gem 'cancancan'
gem 'rails_12factor', group: :production


# assets
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'compass-rails'
gem 'modernizr-rails'
gem 'jquery-ui-rails'

# docs
gem 'sdoc', '~> 0.4.0', group: :doc

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
  # gem 'capistrano-rails'
  gem "better_errors"
  gem "binding_of_caller"
  gem "quiet_assets"
  gem "bullet"
  gem "lol_dba"
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'machinist'
  gem 'faker'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'selenium-webdriver'
end

group :development, :test do
  gem "rspec-rails"
  gem 'debugger'
end
