FactoryBot.define do
  factory :school do
    name 'School Name'
    subdomain { Faker::Internet.domain_word }
  end
end
