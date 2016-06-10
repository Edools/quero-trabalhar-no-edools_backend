FactoryGirl.define do
    factory :course do
      title {Faker::Company.name}
      description {Faker::Company.name}
      content {Faker::Company.name}
      duration {Faker::Number.number(1)}
      date_of_creation {Faker::Time.forward(23, :morning)}
      price {Faker::Commerce.price }
      school_id {Faker::Number.number(1)}

      factory :invalid_course do
        title nil
        description nil
        content nil
        duration nil
        date_of_creation nil
        price nil
        school_id nil
      end
  end
end
