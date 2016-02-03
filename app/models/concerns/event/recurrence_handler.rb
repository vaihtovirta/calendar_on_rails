class Event
  module RecurrenceHandler
    extend ActiveSupport::Concern

    included do
      scope :recurring_events, -> { where.not(periodicity: 0) }
      scope :recurring_once, -> { where(periodicity: 0) }
    end

    module ClassMethods
      def populate_recurring_events(date)
        EventRecurrence::Populator.new(date, recurring_events)
          .call
          .concat(recurring_once)
      end
    end
  end
end
