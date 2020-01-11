user1 = FactoryBot.create(:user)
user2 = FactoryBot.create(:user)


[user1, user2].each do |user|
  10.times do
    FactoryBot.create :event,
      periodicity: Event.periodicities.keys.sample,
      user: user,
      starts_at: Time.now + rand(1..10).days
  end
end
