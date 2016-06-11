FactoryGirl.define do
  factory :course_student do
      course_id {Faker::Number.number(2)}
      student_id {Faker::Number.number(2)}
  end
end
