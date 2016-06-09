FactoryGirl.define do
  factory :student do
    name { Faker::Name.name }
    adress { Faker::Address.street_address }
    phone "(13)99999-6666"
  end
end
