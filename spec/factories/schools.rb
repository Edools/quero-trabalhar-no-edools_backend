FactoryGirl.define do
  factory :school do
    name           "Test School"
    email          "test_school@email.com"
    pitch          "test"
    sequence :subdomain do |n|
      "test_school#{n}"
    end
    creation_date Date.today
  end

end
