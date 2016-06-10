FactoryGirl.define do
  factory :course do
    title { Faker::Lorem.name }
    school
    description { Faker::Lorem.paragraph }
    content { Faker::Lorem.paragraph }
    duration { "#{[*1, 2, 3].sample} months" }
    price [*10..20].sample
    total_active_students [*1..6].sample
  end
end
