source "https://rubygems.org"

ruby "2.6.5"

gem "decent_exposure"
gem "devise"
gem "dotenv"
gem "draper"
gem "ice_cube"
gem "pg"
gem "puma"
gem "rails", "~> 6"
gem "responders", "~> 3"
gem "simple_calendar", "~> 1"
gem "simple_form"
gem "validates_email_format_of"

# Assets
gem "coffee-rails"
gem "jquery-rails"
gem "material_icons"
gem "pickadate-rails"
gem "sass-rails"
gem "slim-rails"
gem "uglifier"
gem "vex_rails"

source "https://rails-assets.org" do
  gem "rails-assets-material-design-lite"
  gem "rails-assets-randomColor"
  gem "rails-assets-tooltipster"
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "bullet"
  gem "dotenv-rails"
  gem "rubocop", require: false
end

group :development, :test do
  gem "brakeman"
  gem "bundler-audit"
  gem "factory_bot_rails"
  gem "ffaker"
  gem "letter_opener"
  gem "pry-rails"
end

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "rails-controller-testing"
  gem "rspec-rails", "~> 4.0.0.beta"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "webdrivers"
end

group :production do
  gem "rails_12factor"
end
