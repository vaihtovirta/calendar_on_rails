module EventRecurrence
  class CollectionBuilder
    attr_reader :recurring_event, :month_interval
    private :recurring_event, :month_interval

    def initialize(recurring_event, month_interval)
      @recurring_event = recurring_event
      @month_interval = month_interval
    end

    def call
      recurring_dates.map do |recurring_date|
        Event.new(event_attributes.merge(starts_at: recurring_date))
      end
    end

    private

    def recurring_dates
      ScheduleCalculator.new(recurring_event, month_interval).call
    end

    def event_attributes
      {
        id: recurring_event.id,
        title: recurring_event.title,
        user_id: recurring_event.user_id
      }
    end
  end
end
