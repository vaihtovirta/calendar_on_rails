require "capybara/poltergeist"

Capybara.configure do |config|
  config.javascript_driver = :poltergeist
end

Capybara.register_driver :poltergeist_debug do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false, timeout: 60)
end
