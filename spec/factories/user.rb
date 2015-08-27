FactoryGirl.define do
  factory :user do
    name { FFaker::Name.name }
    password 'password'
    password_confirmation 'password'
    email { FFaker::Internet.email }
  end
end
