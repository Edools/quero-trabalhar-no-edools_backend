FactoryGirl.define do
  factory :student do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    birthday { Faker::Date.birthday }
  end
end
