FactoryBot.define do
  factory :student do
    name { Faker::Artist.name }
    active { rand(2) == 1 }
  end
end
