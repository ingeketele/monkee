# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'cleaning database'
Activity.destroy_all
User.destroy_all

puts 'creating users'

User.create!({
  email: 'me@gmail.com',
  password: '123456'
})

User.create!({
  email: 'her@gmail.com',
  password: '123456'
})

puts "created #{User.count} users"
puts 'creating activities'

Activity.create!({
  user_id: user.id,
  Title: 'Danse and fun classes',
  address: 'Oslo',
  date: '12 July 2019',
  description: 'This is a fun danse class open to all',
  rating: 5,
  capacity: 10,
})

Activity.create!({
  user_id: user.id,
  Title: 'Tour to the forest',
  address: 'Oslo',
  date: '31 July 2019',
  description: 'Cool tour to the forest',
  rating: 4,
  capacity: 20,
})

Activity.create!({
  user_id: user.id,
  Title: 'Swimming lessons in the lake',
  address: 'Oslo',
  date: '31 Aug 2019',
  description: 'Come learn to swim in the lake',
  rating: 3,
  capacity: 50,
})

puts "created #{Activity.count} activities"
