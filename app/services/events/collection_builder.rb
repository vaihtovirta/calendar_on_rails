module Events
  class CollectionBuilder
    include IceCube

    attr_reader :recurring_event, :month_interval
    private :recurring_event, :month_interval

    delegate :id,
             :periodicity,
             :starts_at,
             :title,
             :user_id,
             :user,
             to: :recurring_event

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

    def event_attributes
      @event_attributes ||= {
        id: id,
        title: title,
        user: user
      }
    end

    def recurring_dates
      Schedule
        .new(starts_at) { |schedule| schedule.add_recurrence_rule(rule) }
        .occurrences_between(*month_interval)
    end

    def rule
      @rule ||= Rule.send(periodicity)
    end
  end
end
