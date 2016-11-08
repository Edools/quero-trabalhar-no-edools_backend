FactoryGirl.define do
  factory :school do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    pitch ''
    subdomain { Faker::Internet.domain_word }
    creation_date '2015-11-20'
  end

  factory :course do
    title { Faker::Name.title }
    description { Faker::Lorem.sentences }
    content { Faker::Lorem.sentences }
    duration 60
    creation_date '2015-11-20'
    active_students 10
    price 10
    association :school, factory: :school
  end
end
