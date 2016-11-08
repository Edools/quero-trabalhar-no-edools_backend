FactoryGirl.define do
  factory :course do
    title 'Curso'
    description 'Só um curso'
    content 'Aprender algo'
    duration '1 ano'
    active_students '10'
    price 1000.0
    
    association :school, factory: :school
  end
end
