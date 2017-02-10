# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    sequence(:title) { |n| "Curso #{n}" }
    description "MyString"
    content "MyString"
    duration "40h"
    price 12.4
    school
  end
end
