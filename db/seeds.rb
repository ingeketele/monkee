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
  first_name: 'Alfred',
  last_name: 'Larvik',
  email: 'him@gmail.com',
  password: '123456'
})

User.create!({
  first_name: 'Sara',
  last_name: 'Olsen',
  email: 'her@gmail.com',
  password: '123456'
})

puts "created #{User.count} users"

puts 'creating activities'

Activity.create!({
  user: User.first,
  title: 'Danse and fun classes',
  address: 'Storgata 1, Oslo',
  date: '15 Aug 2019',
  duration: 5,
  description: 'This is a fun danse class open to all',
  rating: 5,
  capacity: 200,
})

Activity.create!({
  user: User.first,
  title: 'Tour to the forest',
  address: 'Torggata 1, Oslo',
  date: '31 July 2019',
  duration: 2,
  description: 'Cool tour to the forest',
  rating: 4,
  capacity: 20,
})

Activity.create!({
  user: User.first,
  title: 'Swimming lessons in the lake',
  address: 'Eiriks gate 2, Oslo',
  date: '31 Aug 2019',
  duration: 3,
  description: 'Come learn to swim in the lake',
  rating: 3,
  capacity: 50,
})

Activity.create!({
  user: User.first,
  title: 'Painting and creative arts',
  address: 'Thorvald Meyers gate 26C, Oslo',
  date: '17 Aug 2019',
  duration: 3,
  description: 'Come and have fun painting and drawing. For children of all ages',
  rating: 3,
  capacity: 25,
})

Activity.create!({
  user: User.first,
  title: 'Introduction to music and instruments',
  address: 'Youngs gate 6, Oslo',
  date: '21 Sept 2019',
  duration: 4,
  description: 'Learn about instruments and sounds in a fun environment',
  rating: 3,
  capacity: 15,
})

Activity.create!({
  user: User.first,
  title: 'Football games 5x5 at local Jens Park',
  address: 'Sørligata 40, Oslo',
  date: '28 July 2019',
  duration: 1,
  description: 'Challenge your friends and build a team to play in local tournament',
  rating: 3,
  capacity: 60,
})

Activity.create!({
  user: User.first,
  title: 'Day at the museum, Nature in Art',
  address: 'Sørligata 40, Oslo',
  date: '01 Aug 2019',
  duration: 2,
  description: 'Come discover Nature through beautiful paintings',
  rating: 3,
  capacity: 50,
})

puts "created #{Activity.count} activities"
