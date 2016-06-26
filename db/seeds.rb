# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create!(username: 'Admin', email: 'admin@gmail.com', password: 'password', password_confirmation: 'password')
janik = User.create!(username: 'Janik', email: 'janik.knittle@gmail.com', password: 'password', password_confirmation: 'password')


40.times do |n|
  username  = Faker::Internet.user_name(5)
  email = Faker::Internet.free_email
  password = "password"
  user = User.create!(username:  username,
               email: email,
               password:              password,
               password_confirmation: password)
end

40.times do |n|
  user = User.all.sample
  speaker = Faker::Name.name
  spoken_date = Faker::Date.between(10.days.ago, 1.days.ago)
  completion_date = Faker::Date.between(1.day.from_now, 7.days.from_now)
  proof = Faker::Internet.url
  quote = Faker::Lorem.paragraph
  stamp = Stamp.create!(user: user,
               speaker: speaker,
               spoken_date: spoken_date,
               completion_date: completion_date,
               proof: proof,
               quote: quote)
end

200.times do |n|
  user = User.all.sample
  stamp = Stamp.all.sample
  wager = Faker::Number.between(1, 150)
  outcome = Faker::Boolean.boolean
  bet = Bet.create!(user: user,
               stamp: stamp,
               wager: wager,
               outcome: outcome)
end

20.times do |n|
  stamp = Stamp.ongoing.sample
  outcome = Faker::Boolean.boolean
  stamp.mark_complete!(outcome, stamp.user)
end
