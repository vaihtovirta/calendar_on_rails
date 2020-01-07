require "capybara/apparition"

Capybara.configure do |_config|
  Capybara.javascript_driver = :apparition
end

Capybara.disable_animation = true
Capybara.default_max_wait_time = 10

Capybara.register_driver :apparition do |app|
  Capybara::Apparition::Driver.new(
    app,
    timeout: 60,
    js_errors: false,
    extensions: ["#{Rails.root}/spec/support/disable_animations.js"]
  )
end
