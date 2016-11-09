FactoryGirl.define do
  factory :school do
    sequence(:name) { |n| "school#{n}"}
    sequence(:owner_email) { |n| "email#{n}@email.com"}
    pitch "School's Pitch"
    sequence(:subdomain) { |n| "domain#{n}"}
  end
end