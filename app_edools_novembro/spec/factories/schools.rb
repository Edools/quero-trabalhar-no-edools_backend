FactoryGirl.define do
  factory :school do
    name { Faker::Name.name}
    email { Faker::Internet.email }
    pitch { Faker::Lorem.paragraph}
    subdomain "#{Faker::Company.profession}.edools.com"
    user_id 1
  end
end
