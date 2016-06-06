# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :school do
    name           "Test School"
    email          "test_school@email.com"
    pitch          "test"
    sequence :subdomain do |n|
      "test_school#{n}"
    end
  end
end
