FactoryGirl.define do
  factory :enrollment do
    course
    student
    active true
  end
end
