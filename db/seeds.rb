# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
25.times do
   User.create!(
   username:     Faker::Internet.user_name,
   email:    Faker::Internet.free_email,
   password: Faker::Internet.password(8)
   )
 end
 #users = User.all


 75.times do
    List.create!(
    title:      Faker::StarWars.planet,
    user_id:    Faker::Number.between(1, User.count)
    )
  end
  #lists = List.all



 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{List.count} lists created"
