module CapybaraHelpers
  def send_esc
    keypress_script = "var e = $.Event('keydown', { keyCode: 27 }); $('body').trigger(e);"
    page.execute_script(keypress_script)
  end

  def screenshot
    page.save_screenshot("#{Rails.root}/test.png", full: true)
  end

  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  private

  def finished_all_ajax_requests?
    return if page.evaluate_script("typeof jQuery == 'undefined'")

    page.evaluate_script("jQuery.active").zero?
  end
end
