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
  date: Time.now,
  description: 'This is a fun danse class open to all',
  rating: 5,
  capacity: 200,
  duration: 2
})

Activity.create!({
  user: User.first,
  title: 'Tour to the forest',
  address: 'Torggata 1, Oslo',
  date: Time.now,
  description: 'Cool tour to the forest',
  rating: 4,
  capacity: 20,
  duration: 3
})

Activity.create!({
  user: User.first,
  title: 'Swimming lessons in the lake',
  address: 'Eiriks gate 2, Oslo',
  date: Time.now,
  description: 'Come learn to swim in the lake',
  rating: 3,
  capacity: 50,
  duration: 2
})

puts "created #{Activity.count} activities"
puts "Created #{User.count} users and #{Activity.count} activities"
