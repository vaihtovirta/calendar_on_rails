class Event < ActiveRecord::Base
  extend SimpleCalendar
  include RecurrenceHandler

  has_calendar

  belongs_to :user

  validates :title, :starts_at, presence: true
  validates :title, length: { minimum: 5, maximum: 20 }

  enum periodicity: { once: 0, every_day: 1, every_week: 2, every_month: 3, yearly: 4 }

  def self.by_date(date)
    return if date.nil?

    populate_recurring_events(date)
  end
end
