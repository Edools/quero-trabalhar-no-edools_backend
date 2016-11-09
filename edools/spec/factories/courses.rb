FactoryGirl.define do
  factory :course do
    sequence(:title) { |n| "course#{n}"}
    description "Description for course"
    content "Course content"
    duration 120
    price 199.99
  end
end