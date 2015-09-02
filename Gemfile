source 'https://rubygems.org'

ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
gem 'responders', '~> 2'
gem 'rollbar', '~> 1.5.3'
gem 'pg'
gem 'dotenv'
gem 'devise'
gem 'decent_exposure'
gem 'simple_form'
gem 'draper'
gem 'simple_calendar'
gem 'ice_cube'

# Assets
gem 'slim-rails'
gem 'sass-rails', '~> 5.0'
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'
gem 'sprockets-rails', require: 'sprockets/railtie'
gem 'material_icons'
gem 'pickadate-rails'
gem 'vex_rails'
gem 'coffee-rails'

source 'https://rails-assets.org' do
  gem 'rails-assets-material-design-lite'
  gem 'rails-assets-tooltipster'
  gem 'rails-assets-randomColor'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'pry-rails'
  gem 'dotenv-rails'
  gem 'letter_opener'
  gem 'rubocop', require: false
end

group :test do
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'poltergeist'
  gem 'database_cleaner'
end

group :production do
  gem 'rails_12factor'
  gem 'puma'
end
