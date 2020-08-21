# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Actor.delete_all
# CastingAgent.delete_all
# Event.delete_all

CastingAgent.delete_all
Actor.delete_all
Event.delete_all

10.times do 
    CastingAgent.create!(name: Faker::Name.name, agency: Faker::Company.name, email: Faker::Internet.unique.email(name: Faker::Name.name, domain: 'example'), username: Faker::Internet.unique.username, password: 'audition', password_confirmation: 'audition', pic: Faker::LoremPixel.image(category: 'people'))
end

30.times do 
    Actor.create!(name: Faker::Name.name, sex: Faker::Gender.binary_type, age: Faker::Number.between(from: 18, to: 100), email: Faker::Internet.unique.email(name: Faker::Name.name, domain: 'example'), username: Faker::Internet.unique.username, password: 'audition', password_confirmation: 'audition', pic: Faker::LoremPixel.image(category: 'fashion'))
end

10.times do
    Event.create!(title: Faker::Theatre::Musicals.unique.title, date: Faker::Date.forward(days: 23), location: ['Pearl Studios', 'Ripley Grier', 'Shetler Studios', 'Chelsea Studios', '42nd Street Studios'].sample, casting_agent_id: CastingAgent.all.ids.sample, production_type: "Musical", pic: Faker::Fillmurray.image)
end

10.times do
    Event.create!(title: Faker::Theatre::Plays.unique.title, date: Faker::Date.forward(days: 23), location: ['Pearl Studios', 'Ripley Grier', 'Shetler Studios', 'Chelsea Studios', '42nd Street Studios'].sample, casting_agent_id: CastingAgent.all.ids.sample, production_type: "Play", pic: Faker::Fillmurray.image )
end