FactoryGirl.define do
  factory :school do
    name { Faker::Company.name }
    contact_email { Faker::Internet.email }
    pitch { Faker::Lorem.paragraph }
    subdomain { Faker::Lorem.word  }
  end
end
