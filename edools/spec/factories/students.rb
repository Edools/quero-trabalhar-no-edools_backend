FactoryGirl.define do
  factory :student do
    sequence(:name) { |n| "Student#{n}"}
    sequence(:email) { |n| "student#{n}@email.com"}
  end
end