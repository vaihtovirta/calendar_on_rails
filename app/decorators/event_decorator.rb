class EventDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  decorates_association :user

  alias event object

  def description
    event.description.presence || "No description"
  end

  def periodicity
    event.periodicity.titleize.downcase
  end

  def show_or_edit_path
    if event.user == current_user
      edit_user_event_path(current_user, event)
    else
      event_path(event)
    end
  end
end
