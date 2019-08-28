FactoryBot.define do
  factory :course do
    title 'Course Title'
    price '9,90'
    association :school, factory: :school
  end
end
