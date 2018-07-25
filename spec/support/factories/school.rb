FactoryBot.define do
  factory :school do
    name  { FFaker::Lorem.word }
    owner_email { FFaker::Internet.email }
    pitch { FFaker::Lorem.paragraph }
    subdomain { FFaker::Internet.domain_word }
    date_creation { FFaker::Time.date }
    user
  end
end