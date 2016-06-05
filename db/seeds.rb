require 'highline/import'
require 'faker'

if Rails.env == 'development'
  answer = ask("Do you wish to clean your current database? (type 'yes' or 'no')")
  if answer.match(/^y(|es)$/)
    School.destroy_all
    Course.destroy_all
    puts "Database cleaned"
  end
  
  5.times do
    school = School.create(
      name: "#{Faker::StarWars.character}'s School", 
      owner_email: Faker::Internet.email, 
      pitch: Faker::StarWars.quote, 
      subdomain: Faker::Internet.domain_word, 
      date_of_creation: Faker::Time.between(2.years.ago, 1.year.ago, :all) 
    ) 
    3.times do
      school.courses.create(
        title: "#{Faker::StarWars.character}'s Specialization Course",
        description: Faker::StarWars.quote,
        content: Faker::StarWars.quote,
        duration: "#{Faker::Number.between(4,10)} semesters",
        creation_date: Faker::Time.between(2.years.ago, 1.year.ago, :all),
        active_students: Faker::Number.between(1000,5000),
        price: Faker::Number.between(100.00,500.00).round(2)
      )
    end
  end

  puts "Database seeded, have fun"
end

 

