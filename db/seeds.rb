# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
0.times do |i|
  Person.create(
  	first_name: Faker::Name.first_name,
  	last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    job: Faker::Company.profession, 
    bio: Faker::Lorem.paragraph(5),
    gender: ['Male','Female'].sample,
  	birthdate: Faker::Date.between(60.years.ago, 1.day.ago),
    picture: Faker::Avatar.image)
end
