FactoryGirl.define do
  factory :school do
    name { Faker::Name.name }
    owner_email { Faker::Internet.email }
    pitch { Faker::Lorem.word }
    subdomain { Faker::Internet.url("#{Faker::Internet.domain_word}.edools.com", nil) }
    trait :empty do
      name nil
      owner_email nil
      subdomain nil
    end
  end
end
