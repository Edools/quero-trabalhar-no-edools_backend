FactoryBot.define do
  factory :course do
    title { Faker::Name.unique.name }
    price '9,90'
    association :school, factory: :school
  end
end
