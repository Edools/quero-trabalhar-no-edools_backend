FactoryGirl.define do
      factory :student do
        name {Faker::Name.name}
        enrollment {Faker::Number.number(6)}
        
      factory :invalid_student do
        name nil
        enrollment nil
        status nil
      end
    end
end
