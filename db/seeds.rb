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
Category.delete_all if Rails.env.development?


handy = Category.create!(title: "Handy Sh*t", image: "https://pegramandnoyes.com/wp-content/uploads/sites/6/does_a_handyman_need_insurance_north_carolina.jpg")
life = Category.create!(title: "Life Sh*t", image: "https://brandsite-static.hdfclife.com/media/image/RS-IB3_qBwmG4y.jpg")
professional = Category.create!(title: "Professional Sh*t", image: "https://www.teamslf.com/wp-content/uploads/2015/03/Fort-Worth-Family-Law-Divorce-Attorneys_1000x599.jpg")


ivy = User.create!(first_name: "Ivy", last_name: "Yu", location: "Shanghai", contact_info: "1888888888", email: "ivy.yu@gmail.com", password: "123123", picture: "https://www.peekskillnurseries.com/wp-content/uploads/2018/04/englishivy.jpg")
skill_ivy = Skill.new(category: handy, title: "Plumber", price_per_hour: 100, earliest_available: Faker::Time.between(2.days.ago, Date.today, :afternoon), latest_available: Faker::Time.between(2.days.ago, Date.today, :evening))
skill_ivy.user_id = ivy.id
skill_ivy.save
skill_ivy_2 = Skill.new(category: life, title: "Arguing with People", price_per_hour: 150, earliest_available: Faker::Time.between(2.days.ago, Date.today, :afternoon), latest_available: Faker::Time.between(2.days.ago, Date.today, :evening))
skill_ivy_2.user_id = ivy.id
skill_ivy_2.save


5.times do
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,  email: Faker::Internet.email, location: Faker::Address.city, contact_info: Faker::PhoneNumber.phone_number, password: Faker::Internet.password)
  user.save!
  # p skill.earliest_available
  # p skill.latest_available
end

skillz = {"Iphone Repair": handy, "Plumber": handy, "Arguing with People": life, "Fun or Scary Clown": life, "Locksmith": handy, "Professional Breakup Advice": professional}

skillz.each do |key, value|
  5.times do
    Skill.create!(title: key, category: value, user: User.all.sample, price_per_hour: [100, 110, 120, 130, 140, 150].sample, earliest_available: Faker::Time.between(2.days.ago, Date.today, :afternoon), latest_available: Faker::Time.between(2.days.ago, Date.today, :evening))
  end
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
