puts 'cleaning database'
Activity.destroy_all
User.destroy_all

puts 'creating users'
User.create!({
  first_name: 'Lars',
  last_name: 'Andersen',
  address: 'Ruseløkkveien 3, 0251 Oslo, Norway',
  email: 'lars.andersen@yahoo.com',
  password: '123456'
})

User.create!({
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
