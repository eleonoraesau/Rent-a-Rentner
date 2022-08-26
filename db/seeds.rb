# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
puts "Creating 30 users..."
9.times do |i|
  user = User.create!(
    username: Faker::TvShows::Friends.character,
    password: Faker::Internet.password(min_length: 8),
    email: Faker::Internet.email
  )
  puts "#{i + 1}. #{user.username}"
end
puts "Finished!"

User.create!(
  username: "jan",
  password: "12345678",
  email: "jan@test.com"
)

Faker::Config.locale = 'de'
Offer.destroy_all
puts "Creating 30 offers..."
9.times do |i|
  offer = Offer.create!(
    name: Faker::TvShows::BojackHorseman.character,
    description: Faker::TvShows::Seinfeld.quote,
    address: Faker::Address.street_name,
    category: %w(babysitting cooking baking knitting boardgames walk).sample,
    availability: %w(Monday😫 Tuesday😒 Wednesday🐸 Thursday🤠 Friday🥳 Saturday🐗 Sunday⛪).sample,
    user: User.all.sample
  )
  puts "#{i + 1}. #{offer.name}"
end
puts "Finished!"
