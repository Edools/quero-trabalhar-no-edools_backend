FactoryGirl.define do
  factory :course do
    title "Awesome Course"
    school
    description "Course Description"
    content "MyText"
    duration { DateTime.now }
    active_students 10
    price 350.0
  end
end
