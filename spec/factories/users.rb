FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@#{Faker::Lovecraft.location}.com" }
    sequence(:username) { |n| "#{Faker::Number.number(15)}" }
    password "#{Faker::Lovecraft.word}#{Faker::Lovecraft.word}"
  end
end
