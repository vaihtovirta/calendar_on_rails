class CalendarHelper
  attr_reader :events, :shared_helper
  private :events, :shared_helper

  delegate :mat_icon, to: :shared_helper

  def initialize(events)
    @events = events
    @shared_helper = SharedHelper.new
  end

  def date_for(date)
    date.day == 1 ? date.strftime("%-d %b") : date.day
  end
end
