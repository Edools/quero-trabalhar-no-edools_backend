FactoryGirl.define do
  factory :student do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    phone "(13)99999-6666"
    document "123.456.789-00"
    status true
    school_id 1
  end
end
