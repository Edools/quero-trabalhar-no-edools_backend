FactoryGirl.define do
  factory :course do
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    duration 50
    active_students { Faker::Number.between(10, 30) }
    price { Faker::Commerce.price }
    association :school
    trait :empty do
      title nil
      description nil
      duration nil
      active_students nil
      price nil
    end
  end
end
