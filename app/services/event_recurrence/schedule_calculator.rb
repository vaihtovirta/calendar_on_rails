module EventRecurrence
  class ScheduleCalculator
    include IceCube

    TIME_PERIODS = { 1 => :daily, 2 => :weekly, 3 => :monthly, 4 => :yearly }

    def initialize(recurring_event, month_interval)
      @recurring_event = recurring_event
      @month_interval = month_interval
    end

    def call
      schedule.occurrences_between(*@month_interval)
    end

    def schedule
      Schedule.new(@recurring_event.starts_at) do |schedule|
        schedule.add_recurrence_rule Rule.public_send(rule_method)
      end
    end

    private

    def rule_method
      TIME_PERIODS[current_periodicity]
    end

    def current_periodicity
      periodicities[@recurring_event.periodicity]
    end

    def periodicities
      @_periodicities ||= Event.periodicities
    end
  end
end
