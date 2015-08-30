FactoryGirl.define do
  factory :event do
    title { FFaker::Lorem.characters(10) }
    starts_at { (Date.today.beginning_of_month..Date.today.end_of_month).to_a.sample }
    periodicity { Event.periodicities.keys.sample }
  end
end
