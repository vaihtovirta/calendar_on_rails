class Event < ActiveRecord::Base
  belongs_to :user, optional: true

  alias_attribute :start_time, :starts_at

  validates :title, :starts_at, presence: true
  validates :title, length: { minimum: 5, maximum: 20 }

  enum periodicity: {
    once: 0,
    daily: 1,
    weekly: 2,
    monthly: 3,
    yearly: 4
  }

  scope :recurring_events, -> { where.not(periodicity: 0) }

  def self.by_date(date)
    return unless date.present?

    Events::Populator
      .new(date)
      .call
      .concat(once)
  end
end
