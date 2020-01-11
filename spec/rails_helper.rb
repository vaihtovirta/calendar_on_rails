ENV["RAILS_ENV"] ||= "test"

require "spec_helper"
require File.expand_path("../config/environment", __dir__)
require "rspec/rails"
require "devise"
require "factory_bot_rails"
require "ffaker"
require "capybara/rspec"
require "capybara/rails"
require "database_cleaner"

Dir[Rails.root.join("spec/support/**/*.rb")].sort.each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Capybara::DSL
  config.include CapybaraHelpers
  config.include Warden::Test::Helpers
  config.include Rails.application.routes.url_helpers
  config.include FactoryBot::Syntax::Methods

  config.infer_spec_type_from_file_location!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
