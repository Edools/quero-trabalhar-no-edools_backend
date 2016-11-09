# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |i|
  name = Faker::Name.name
  owner_email = Faker::Internet.email
  pitch = Faker::Lorem.paragraph
  subdomain = Faker::Internet.domain_word
  puts "Cadastrando #{name}"
  school_created_at = Faker::Time.between(7.days.ago, Date.today)
  school = School.create(
    name: name, 
    owner_email: owner_email,
    pitch: pitch,
    subdomain: subdomain,
    created_at: school_created_at
  )
  if school.present?
    rand(1..10).times do |j|
      title = Faker::Lorem.sentence
      description = Faker::Lorem.paragraph(2)
      content = Faker::Lorem.paragraph(3)
      duration = rand(30..200)
      course_created_at = Faker::Date.between(school_created_at, Date.today)
      active_students = rand(1..50)
      price = Faker::Commerce.price
      Course.create(
        title: title,
        description: description,
        content: content,
        duration: duration,
        created_at: course_created_at,
        active_students: active_students,
        price: price,
        school: school
      )
    end
  end
end

user = User.new(
  :email                 => "admin@ig.com.br",
  :password              => "123456",
  :password_confirmation => "123456"
)
user.save!