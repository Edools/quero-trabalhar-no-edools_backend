# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

25.times do
  s = School.create(
    name: Faker::Name.unique.name,
    subdomain: Faker::Internet.domain_word,
    owner_email: Faker::Internet.email
  )

  Course.create(
    title: Faker::Name.unique.name,
    school: s,
    active_students: Faker::Number.number(digits: 2),
    duration: Faker::Number.number(digits: 2),
    price: Faker::Number.number(digits: 2)
  )
end
