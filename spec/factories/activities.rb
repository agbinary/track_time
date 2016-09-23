FactoryGirl.define do
  factory :activity do
    name { Faker::Name.name }
    start_time Time.now
    end_time Time.now
    date_report Date.today
    total_time { Faker::Number.between(1, 100) }
    status :close
    track_type :timer
    association :user
    association :project
  end
end
