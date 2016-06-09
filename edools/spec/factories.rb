FactoryGirl.define do
  factory :school do
    name "School name"
    pitch  "School pitch"
    owner_email "owner@email.com"
    subdomain "academia-bizstart.edools.com"
  end

  factory :invalid_school, class: School do
    name ""
    pitch  "School pitch"
    owner_email "invalid_email.com"
    subdomain "academia-bizstart.com"
  end
end
