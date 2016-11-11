FactoryGirl.define do
  factory :school do
    name "MyString"
    owner_email "MyString"
    pitch "MyString"
    sequence(:subdomain) {|n| "subdomain#{n}.edools.com" }
  end
end
