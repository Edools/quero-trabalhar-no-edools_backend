FactoryGirl.define do
    factory :school do
      name {Faker::Company.name}
      email {Faker::Internet.email }
      pitch {Faker::Name.name}
      subdomain {Faker::Internet.domain_name}
      date_of_creation {Faker::Time.between(DateTime.now - 1, DateTime.now)}

    factory :invalid_school do
      name nil
      email nil
      pitch nil
      subdomain nil
      date_of_creation nil
    end
  end
end
