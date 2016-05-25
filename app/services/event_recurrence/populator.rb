module EventRecurrence
  class Populator
    attr_reader :date
    private :date

    delegate :recurring_events, to: 'Event'

    def initialize(date)
      @date = date
    end

    def call
      populate_events
    end

    private

    def populate_events
      recurring_events.map do |recurring_event|
        CollectionBuilder.new(recurring_event, month_interval).call
      end.flatten
    end

    def month_interval
      [
        date.beginning_of_month.beginning_of_week,
        date.end_of_month.end_of_week
      ]
    end
  end
end
