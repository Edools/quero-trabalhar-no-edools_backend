FactoryGirl.define do
  factory :school do
    name           "Test School"
    email          "test_school@email.com"
    pitch          "test"
    subdomain      "test_school"
    creation_date Date.today
  end

end
