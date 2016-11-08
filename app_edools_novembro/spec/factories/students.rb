FactoryGirl.define do
  factory :student do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    phone "(13)99999-6666"
    document "765.378.951-03"
    responsible {Faker::Name.name }
    registration "QWE74125896"
    status_student true
    course_id 1
    school_id 1
    user_id 1
  end
end
