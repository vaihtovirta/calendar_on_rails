module EventRecurrence
  class ScheduleCalculator
    include IceCube

    attr_reader :recurring_event, :month_interval
    private :recurring_event, :month_interval

    delegate :periodicities, to: 'Event'
    delegate :starts_at, :periodicity, to: :recurring_event

    TIME_PERIODS = { 1 => :daily, 2 => :weekly, 3 => :monthly, 4 => :yearly }.freeze

    def initialize(recurring_event, month_interval)
      @recurring_event = recurring_event
      @month_interval = month_interval
    end

    def call
      schedule.occurrences_between(*month_interval)
    end

    def schedule
      Schedule.new(starts_at) do |schedule|
        schedule.add_recurrence_rule Rule.public_send(rule_method)
      end
    end

    private

    def rule_method
      TIME_PERIODS[current_periodicity]
    end

    def current_periodicity
      periodicities[periodicity]
    end
  end
end
