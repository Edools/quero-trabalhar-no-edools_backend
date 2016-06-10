FactoryGirl.define do
  factory :student do
    name {Faker::Name.name}
    enrollment {Faker::Number.number(6)}
    status 1
  end
end
