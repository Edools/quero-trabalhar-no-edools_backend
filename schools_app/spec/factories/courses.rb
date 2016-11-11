FactoryGirl.define do
  factory :course do
    title       { Faker::Name.title }
    school
    description { Faker::Lorem.paragraph }
    content     { Faker::Lorem.paragraph }
    duration    { '3 semanas' }
    price       { Faker::Commerce.price }
  end
end
