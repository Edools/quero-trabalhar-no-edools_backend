FactoryBot.define do
  factory :course do
    title { Faker::Educator.course_name }
    description { Faker::ChuckNorris.fact }
    duration { 1 }
    duration_unit { :days }
    creation_date { 1.year.ago}
    price { 123 }
  end
end
