# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
puts "Creating 30 users..."
30.times do |i|
  user = User.create!(
    username: Faker::TvShows::Friends.character,
    password: Faker::Internet.password(min_length: 8),
    email: Faker::Internet.email
  )
  puts "#{i + 1}. #{user.username}"
end
puts "Finished!"

Offer.destroy_all
puts "Creating 30 offers..."
30.times do |i|
  offer = Offer.create!(
    name: Faker::TvShows::BojackHorseman.character,
    description: Faker::TvShows::Seinfeld.quote,
    location: Faker::Fantasy::Tolkien.location,
    category: %w(babysitting cooking baking knitting boardgames walk).sample,
    availability: %w(monday tuesday wednesday thursday friday saturday sunday).sample,
    user: User.all.sample
  )
  puts "#{i + 1}. #{offer.name}"
end
puts "Finished!"
