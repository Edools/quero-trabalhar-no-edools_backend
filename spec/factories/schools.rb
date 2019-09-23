FactoryBot.define do
  factory :school do
    name { Faker::Educator.secondary_school }
    pitch { Faker::Lorem.paragraph }
    owner_email { Faker::Internet.email }
    subdomain { Faker::Internet.slug }
    creation_date { 2.years.ago }
  end
end
