ENV["RAILS_ENV"] ||= "test"

require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "devise"
require "factory_bot_rails"
require "ffaker"
require "capybara/rspec"
require "capybara/rails"
require "database_cleaner"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
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

if RUBY_VERSION >= "2.6.0"
  if Rails.version < "5"
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        # HACK: to avoid MonitorMixin double-initialize error:
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end
