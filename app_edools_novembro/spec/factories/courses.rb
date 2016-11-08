FactoryGirl.define do
  factory :course do
    title { Faker::Name.title }
    description { Faker::Lorem.paragraph }
    content { Faker::Lorem.paragraph }
    duration "10 meses"
    price { Faker::Number.decimal(2) }
    school_id 1
    user_id 1
  end
end
