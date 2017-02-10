# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :school do
    sequence(:name) { |n| "Escola #{n}" }
    sequence(:owner_email) { |n| "fulano#{n}@escola.com" }
    pitch "MyString"
    subdomain "minhaescola.edools.com"
  end
end
