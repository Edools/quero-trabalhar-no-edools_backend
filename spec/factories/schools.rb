FactoryGirl.define do
  factory :school do
    name "#{Faker::StarWars.character}'s School"
    owner_email Faker::Internet.email
    pitch Faker::StarWars.quote
    subdomain Faker::Internet.domain_word
    date_of_creation Faker::Time.between(2.years.ago, 1.year.ago, :all)
  end

end
