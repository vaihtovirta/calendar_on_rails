class Recurrencer
  include IceCube

  def initialize(date, recurring_events, periodicities)
    @date = date
    @recurring_events = recurring_events
    @periodicities = periodicities
  end

  def populate
    @recurring_events.map do |recurring_event|
      @event = recurring_event

      recurring_dates.collect do |recurring_date|
        @recurring_date = recurring_date
        Event.new(event_attributes)
      end
    end
  end

  private

  def recurring_dates
    schedule.occurrences_between(*month_interval)
  end

  def schedule
    Schedule.new(@event.starts_at) do |schedule|
      schedule.add_recurrence_rule Rule.public_send(rule_method)
    end
  end

  def month_interval
    [@date.beginning_of_month.beginning_of_week, @date.end_of_month.end_of_week]
  end

  def rule_method
    case @periodicities[@event.periodicity]
    when 1 then :daily
    when 2 then :weekly
    when 3 then :monthly
    when 4 then :yearly
    else ''
    end
  end

  def event_attributes
    { id: @event.id, title: @event.title,
      starts_at: @recurring_date, user_id: @event.user_id }
  end
end
