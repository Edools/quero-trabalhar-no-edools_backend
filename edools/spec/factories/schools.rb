FactoryBot.define do
  factory :school do
    name { Faker::Name.unique.name }
    subdomain { Faker::Internet.domain_word }
  end
end
