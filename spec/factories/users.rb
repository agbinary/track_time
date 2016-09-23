FactoryGirl.define do
  factory :user do
    uid { Faker::Lorem.characters(5) }
    nickname { Faker::Lorem.word }
    name { Faker::Name.name }
    token { Faker::Lorem.characters(10) }
    secret { Faker::Lorem.characters(10) }
  end
end
