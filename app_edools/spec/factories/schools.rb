FactoryGirl.define do
  factory :school do
    name { Faker::Name.name}
    email { Faker::Internet.email }
    pitch { Faker::Lorem.paragraph}
    subdominio "academia-bizstart.edools.com"
  end
end
