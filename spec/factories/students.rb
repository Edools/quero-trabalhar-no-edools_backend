FactoryGirl.define do
  factory :student do
    name { Faker::Company.name }
    email { Faker::Internet.email }
    birthday { Faker::Date.birthday }
  end
end
