FactoryGirl.define do
  factory :school do
    name          { Faker::Name.name }
    owner_email   { Faker::Internet.email }
    pitch         { Faker::Lorem.paragraph }
    subdomain     "#{Faker::Company.profession}.edools.com"
    creation_date "2016-11-03"
  end
end
