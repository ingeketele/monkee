<<<<<<< HEAD
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=======
>>>>>>> a3ee60609172cfaba2a1b27e35e9ef84342f545f
puts 'cleaning database'
Activity.destroy_all
User.destroy_all

puts 'creating users'
<<<<<<< HEAD

User.create!({
  email: 'me@gmail.com',
=======
User.create!({
  first_name: 'Lars',
  last_name: 'Andersen',
  address: 'Ruseløkkveien 3, 0251 Oslo, Norway',
  email: 'lars.andersen@yahoo.com',
>>>>>>> a3ee60609172cfaba2a1b27e35e9ef84342f545f
  password: '123456'
})

User.create!({
<<<<<<< HEAD
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
=======
  first_name: 'Magne',
  last_name: 'Larsen',
  address: 'Eiriks gate 2, 0650 Oslo, Norway',
  email: 'magne.larsen@hotmail.com',
  password: '123456'
})

puts 'creating Activities'

Activity.create!({
  title: 'Horse Riding',
  address: 'Storgata 1, Oslo',
  date: Time.now,
  description: 'The best show',
  capacity: 200
})

Activity.create!({
  title: 'Kids Rock Show',
  address: 'Torggata 1, Oslo',
  date: Time.now,
  description: 'The very best show',
  capacity: 100
})

puts "Created #{User.count} users and #{Activity.count} activities"
>>>>>>> a3ee60609172cfaba2a1b27e35e9ef84342f545f
