require 'faker'

FactoryBot.define do
  factory :course do
    title Faker::ProgrammingLanguage.name
    description Faker::StrangerThings.quote
    content Faker::Simpsons.quote
    price Faker::Number.decimal(2)
    start_date '2018-07-24'
    end_date '2018-07-25'
    school
  end
end