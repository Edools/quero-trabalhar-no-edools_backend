FactoryGirl.define do
  factory :course_student do
      name {Faker::Name.name}
      course_id {Faker::Number.number(2)}
      student_id {Faker::Number.number(2)}
  end
end
