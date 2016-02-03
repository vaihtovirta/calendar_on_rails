module EventRecurrence
  class Populator
    def initialize(date, recurring_events)
      @recurring_events = recurring_events
      @date = date
    end

    def call
      events.flatten
    end

    private

    def events
      @recurring_events.map do |recurring_event|
        recurring_dates(recurring_event).collect do |recurring_date|
          attributes = event_attributes(recurring_event)
          attributes[:starts_at] = recurring_date

          Event.new(attributes)
        end
      end
    end

    def recurring_dates(recurring_event)
      ScheduleCalculator.new(recurring_event, month_interval).call
    end

    def event_attributes(recurring_event)
      {
        id: recurring_event.id,
        title: recurring_event.title,
        user_id: recurring_event.user_id
      }
    end

    def month_interval
      @_month_interval ||= [@date.beginning_of_month.beginning_of_week,
                            @date.end_of_month.end_of_week]
    end
  end
end
