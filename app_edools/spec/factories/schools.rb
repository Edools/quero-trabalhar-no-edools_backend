FactoryGirl.define do
  factory :school do
    name { Faker::Name.name}
    email_responsible { Faker::Internet.email }
    pitch { Faker::Lorem.paragraph}
    subdomain "#{Faker::Company.profession}.edools.com"
  end
end
