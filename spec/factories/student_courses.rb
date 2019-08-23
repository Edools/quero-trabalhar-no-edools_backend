FactoryBot.define do
  factory :student_course do
     active { true }
     association :student, factory: :student
     association :course, factory: :course
  end
end
