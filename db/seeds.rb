# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do
  School.create(
    name: Faker::Educator.secondary_school,
    pitch: Faker::Lorem.paragraph,
    owner_email: Faker::Internet.email,
    subdomain: Faker::Internet.slug,
    creation_date: 2.years.ago
  )
end

School.all.each do |school|
  5.times do
    Course.create(
      school_id: school.id,
      title: Faker::Educator.course_name,
      description: { Faker::Lorem.paragraph,
      duration: 1,
      duration_unit: 1,
      creation_date: 1.year.age,
      price: 123
    )
  end
end