FactoryBot.define do
  factory :event do
    title { FFaker::Lorem.characters(10) }
    starts_at { Time.zone.today.beginning_of_month }
    periodicity { Event.periodicities.keys.sample }
  end
end
