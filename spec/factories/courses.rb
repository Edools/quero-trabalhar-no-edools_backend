require 'faker'

FactoryGirl.define do
  factory :course do
    title Faker::StarWars.name
    description Faker::StarWars.quote
    content Faker::StarWars.quote
    duration "#{Faker::Number.between(4,10)} semestres"
    creation_date Faker::Time.between(2.years.ago, 1.year.ago, :all)
    active_students Faker::Number.between(1000,5000)
    price Faker::Number.between(100,500)
  end

end
