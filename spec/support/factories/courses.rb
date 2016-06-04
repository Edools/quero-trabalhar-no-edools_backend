# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    title "Test Course"
    association :school, factory: :school
    description "Test description"
    content "Test content"
    duration 100
    price 100.00

  end
end
