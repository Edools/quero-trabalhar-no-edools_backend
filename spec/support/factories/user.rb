FactoryBot.define do
  factory :user do
    email        { FFaker::Internet.email }
    password     '123mudar'

    factory :admin do
      after(:create) {|user| user.add_role(:admin)}
    end
    
  end
end