# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Review.delete_all if Rails.env.development?
Booking.delete_all if Rails.env.development?
Skill.delete_all if Rails.env.development?
User.delete_all if Rails.env.development?

User.create!(email: "ivy.yu@gmail.com", password: "123123")

5.times do
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,  email: Faker::Internet.email, location: Faker::Address.city, contact_info: Faker::PhoneNumber.phone_number, password: Faker::Internet.password)
  user.save!
  skill = Skill.new(title: %w(plumber iphone-fixer arguing-with-people professional-clown).sample, price_per_hour: [100, 110, 120, 130, 140, 150].sample, earliest_available: Faker::Time.between(2.days.ago, Date.today, :afternoon), latest_available: Faker::Time.between(2.days.ago, Date.today, :evening))
  skill.user = user
  skill.save!
  p skill.earliest_available
  p skill.latest_available
end

User.all.each do |user|
  3.times do
    booking = Booking.new(user: user, skill: Skill.all.sample)
    booking.start_time = Faker::Time.between(2.days.ago, Date.today, :afternoon)
    booking.end_time = Faker::Time.between(2.days.ago, Date.today, :evening)
    booking.total_price = booking.skill.price_per_hour * 2
    booking.address = Faker::Address.street_address
    booking.save!
    3.times do
      rating = Array(0..5).sample
      p rating
      review = Review.create!(content: Faker::Hipster.sentence, rating: rating, booking: booking)
    end
  end
end
