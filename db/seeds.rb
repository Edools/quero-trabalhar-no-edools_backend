# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do
  school = School.new(
    name: Faker::Educator.secondary_school,
    pitch: Faker::Lorem.paragraph,
    owner_email: Faker::Internet.email,
    subdomain: Faker::Internet.slug,
    creation_date: 2.years.ago
  )

  # sometimes school can be invalid

  if school.save
    5.times do
      course = Course.create(
        school_id: school.id,
        title: Faker::Educator.course_name,
        description: Faker::Lorem.paragraph,
        duration: 1,
        duration_unit: 1,
        creation_date: 1.year.ago,
        price: 123,
        active_students: 10
      )

      5.times do
        Student.create(
          course_id: course,
          name: Faker::Artist.name,
          active: rand(2) == 1
        )
      end
    end
  end
end