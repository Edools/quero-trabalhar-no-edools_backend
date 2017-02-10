FactoryGirl.define do
  factory :course do
    title "Test Course"
    association :school, factory: :school
    description "Test description"
    content "Test content"
    duration 100
    active_students 0
    price 100.00
    creation_date Date.today
  end

end
