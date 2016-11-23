FactoryGirl.define do
  factory :valid_course, class: 'Course' do
    title { Forgery(:lorem_ipsum).words(3) }
    description { Forgery(:lorem_ipsum).words(10) }
    content { Forgery(:lorem_ipsum).words(10) }
    duration { Forgery('basic').number }
    price { Forgery('monetary').money }

    association :school, factory: :valid_school
  end

  factory :invalid_course, parent: :valid_course do
    title nil
    description nil
    content nil
    duration nil
    price nil

    school nil
  end
end
