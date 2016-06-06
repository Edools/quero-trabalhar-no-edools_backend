FactoryGirl.define do
  factory :school do
    sequence(:name) { |n| "Awesome School #{n}" }
    sequence(:owner_email) { |n| "owner@school#{n}.com" }
    pitch 'Awesome description'
  end
end
