module Events
  class Populator
    attr_reader :date
    private :date

    delegate :recurring_events, to: "Event"

    def initialize(date)
      @date = date
    end

    def call
      populate_events
    end

    private

    def month_interval
      @month_interval ||= [
        date.beginning_of_month.beginning_of_week,
        date.end_of_month.end_of_week
      ]
    end

    def populate_events
      recurring_events.flat_map do |recurring_event|
        Events::CollectionBuilder
          .new(recurring_event, month_interval)
          .call
      end
    end
  end
end
