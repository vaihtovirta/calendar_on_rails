class Event < ActiveRecord::Base
  extend SimpleCalendar

  has_calendar

  belongs_to :user

  validates :title, :starts_at, presence: true
  validates :title, length: { minimum: 5, maximum: 20 }

  enum periodicity: { once: 0, every_day: 1, every_week: 2, every_month: 3, yearly: 4 }

  scope :recurring_events, -> { where.not(periodicity: 0) }
  scope :recurring_once, -> { where(periodicity: 0) }

  def self.by_date(date)
    return unless date.present?

    EventRecurrence::Populator.new(date).call.concat(recurring_once)
  end
end
