require 'faker'

FactoryBot.define do
  factory :school do
    name Faker::University.name
    owner_email Faker::Internet.email
    pitch 'https://www.youtube.com/watch?v=jEHITP3VksA'
    subdomain Faker::Internet.domain_word
  end
end