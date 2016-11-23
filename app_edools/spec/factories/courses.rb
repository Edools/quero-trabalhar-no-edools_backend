FactoryGirl.define do
  factory :course do
    title { Faker::Name.title }
    description { Faker::Lorem.paragraph }
    content { Faker::Lorem.paragraph }
    duration 10
    price { Faker::Number.decimal(2) }
    school_id 1
  end
end
