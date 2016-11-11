FactoryGirl.define do
  factory :student do
    name  { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
