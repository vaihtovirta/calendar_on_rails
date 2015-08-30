module EventsHelper
  def show_or_edit_path(event)
    if event.user == current_user
      edit_user_event_path(current_user, event)
    else
      event_path(event)
    end
  end

  def calendar_options
    {
      next_link: next_link,
      previous_link: prev_link,
      header: { class: 'calendar-header title-center' },
      table: { class: 'calendar--table' },
      tr: { class: 'calendar-row' }
    }
  end

  def random_tip
    tips = YAML.load(File.open("#{Rails.root}/lib/support/tips.yml"))
    tips['tips'].sample
  end

  def calendar_date_for(date)
    (date.day == 1) ? date.strftime('%-d %b') : date.day
  end

  private

  def prev_link
    ->(param, date_range) { link_to mat_icon('navigate_before'), param => date_range.first - 1.day }
  end

  def next_link
    ->(param, date_range) { link_to mat_icon('navigate_next'), param => date_range.last + 1.day }
  end
end
