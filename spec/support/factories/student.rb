FactoryGirl.define do
  factory :valid_student, class: 'Student' do
    name { Forgery(:lorem_ipsum).words(3) }
    matricula { Forgery(:lorem_ipsum).words(1) }

    association :course, factory: :valid_course
  end

  factory :invalid_student, parent: :valid_student do
    name nil
    matricula nil

    course nil
  end
end
