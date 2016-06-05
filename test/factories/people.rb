FactoryGirl.define do
  factory :person do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email Faker::Internet.email
    job Faker::Company.profession
    bio Faker::Lorem.paragraph(5)
    gender ['M','F'].sample
    birthdate Faker::Date.between(60.years.ago, 1.day.ago)
    picture Faker::Avatar.image
  end
end
