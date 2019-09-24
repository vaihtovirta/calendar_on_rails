require 'capybara/apparition'

Capybara.configure do |config|
  Capybara.javascript_driver = :apparition
end
