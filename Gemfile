source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'

# Use sqlite3 as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'


# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

source 'https://rails-assets.org' do
  gem 'rails-assets-normalize-scss', '~> 3.0.1'
  gem 'rails-assets-stylish-scss', '~> 0.0.5'
  gem 'rails-assets-angular', '1.2.14'
  gem 'rails-assets-angular-resource', '1.2.14'
  gem 'rails-assets-angular-sanitize', '1.2.14'
  gem 'rails-assets-angular-animate', '1.2.14'
  gem 'rails-assets-angular-i18n', '1.2.14'
  gem 'rails-assets-restangular', '~> 1.3.1'
  gem 'rails-assets-lodash', '~> 2.4.1'
end

gem 'simple_form', '~> 3.0.2'

gem 'enumerate_it', '~> 1.2.0'

gem 'sweetalert-rails', '~> 0.5.0'

gem "responders"

gem 'puma'
gem 'foreman'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'spring'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0.1'
  gem 'shoulda-matchers', '~> 2.6.1'

  gem 'rails-assets-angular-mocks', '1.2.14'
  gem 'rails-assets-angular-scenario', '1.2.14'

  gem 'awesome_print'
  gem 'pry-rails'
  
  gem 'dotenv-rails'
 end
 
 group :test do
  gem 'capybara', '~> 2.3.0'
  gem 'launchy', '~> 2.4.2'
  gem 'database_cleaner', '~> 1.3.0'
  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'forgery', '~> 0.6.0'
  gem 'fakeweb', '~> 1.3.0'
end