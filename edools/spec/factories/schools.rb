FactoryGirl.define do
  factory :school do
    name {Faker::Company.name}
    email {Faker::Internet.email }
    pitch {Faker::Name.name}
    subdomain {Faker::Internet.domain_name}
    date_of_creation {Faker::Time.between(DateTime.now - 1, DateTime.now)}
  end
end
