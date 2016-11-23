# Factory.sequence :email do |n|
# end
FactoryGirl.define do
  sequence :email do |n|
    "user_#{n}@escola.com"
  end

  factory :user do
    email { generate :email }
    password 'fakepassword'
  end
end
