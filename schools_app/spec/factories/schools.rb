FactoryGirl.define do
  factory :school do
    name        { Faker::Name.name }
    owner_email { Faker::Internet.email }
    pitch       { Faker::Lorem.word }
    subdomain   { "#{ Faker::Educator.secondary_school.downcase.gsub(' ', '-') }.edools.com" }
  end
end
