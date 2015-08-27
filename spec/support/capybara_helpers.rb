module CapybaraHelpers
  def send_esc
    keypress_script = 'var e = $.Event(\'keydown\', { keyCode: 27 }); $(\'body\').trigger(e);'
    page.execute_script(keypress_script)
  end

  def screenshot
    page.save_screenshot("#{Rails.root}/test.png", full: true)
  end

  def close_vex_modal
    sleep 1
    return if first('.vex-overlay').nil?

    find('.vex-close').click
  end

  def wait_for_ajax
    Timeout.timeout(Capybara.default_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  private

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end
