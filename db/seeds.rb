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

# User.all.each do |n|
#   stamps = Stamp.all.sample(5)
#   stamps.each do |s|
#     b = n.ledger.bets.build
#     b.stamp = s
#     b.wager = Faker::Number.between(1, (n.ledger.available * 0.9))
#     b.outcome = Faker::Boolean.boolean
#     b.save
#   end
# end

200.times do |n|
  user = User.all.sample
  stamp = Stamp.all.sample
  bet = user.ledger.bets.build
  bet.stamp = stamp
  bet.wager = Faker::Number.between(1, (user.ledger.available * 0.9))
  bet.outcome = Faker::Boolean.boolean
  bet.save
end

20.times do |n|
  stamp = Stamp.ongoing.sample
  outcome = Faker::Boolean.boolean
  stamp.mark_complete!(outcome, stamp.user)
end
