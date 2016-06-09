FactoryGirl.define do
  factory :school do
    name "School name"
    pitch  "School pitch"
    owner_email "owner@email.com"
    subdomain "academia-bizstart.edools.com"
  end

  factory :invalid_school, class: School do
    name ""
    pitch  "School pitch"
    owner_email "invalid_email.com"
    subdomain "academia-bizstart.com"
  end

  factory :course do
    title "Course title"
    description "Description"
    content "Content"
    duration "1 month"
    price 100.0
  end

  factory :invalid_course, class: Course do
    title ""
    description ""
    content ""
    duration ""
    price -1
  end

  factory :student do
    name "Student name"
  end

  factory :invalid_student, class: Student do
    name ""
  end
end
