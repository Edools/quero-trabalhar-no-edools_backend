FactoryGirl.define do
  factory :school do
    name { Faker::Name.name }
    owner_email { Faker::Internet.email }
    pitch { Faker::Lorem.word }
    subdomain { "#{Faker::Internet.domain_word}.edools.com" }
    trait :empty do
      name nil
      owner_email nil
      subdomain nil
    end
  end
end
