class Event
  module RecurrenceHandler
    extend ActiveSupport::Concern
    include IceCube

    included do
      scope :recurring_events, -> { where.not(periodicity: 0) }
      scope :recurring_once, -> { where(periodicity: 0) }
    end

    module ClassMethods
      def populate_recurring_events(date)
        Recurrencer.new(date, recurring_events, periodicities)
          .populate
          .concat(recurring_once)
          .flatten
      end
    end
  end
end
