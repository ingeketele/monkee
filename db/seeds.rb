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
  date: Time.now,
  duration: 2,
  description: 'Zombie ipsum brains reversus ab cerebellum viral inferno, brein nam rick mend grimes malum cerveau cerebro. De carne cerebro lumbering animata cervello corpora quaeritis. Summus thalamus brains sit​​, morbo basal ganglia vel maleficia? De braaaiiiins apocalypsi gorger omero prefrontal cortex undead survivor fornix dictum mauris. Hi brains mindless mortuis limbic cortex soulless creaturas optic nerve, imo evil braaiinns stalking monstra hypothalamus adventus resi hippocampus dentevil vultus brain comedat cerebella pitiutary gland viventium. Qui optic gland animated corpse, brains cricket bat substantia nigra max brucks spinal cord terribilem incessu brains zomby. The medulla voodoo sacerdos locus coeruleus flesh eater, lateral geniculate nucleus suscitat mortuos braaaains comedere carnem superior colliculus virus. Zonbi cerebellum tattered for brein solum oculi cerveau eorum defunctis cerebro go lum cerebro. Nescio brains an Undead cervello zombies. Sicut thalamus malus putrid brains voodoo horror. Nigh basal ganglia tofth eliv ingdead.',
  rating: 5,
  capacity: 200,
  price: 150
})

Activity.create!({
  user: User.first,
  title: 'Tour to the forest',
  address: 'Torggata 1, Oslo',
  date: Time.now,
  duration: 3,
  description: 'Zombies reversus ab inferno, nam malum cerebro. De carne animata corpora quaeritis. Summus sit​​, morbo vel maleficia? De Apocalypsi undead dictum mauris. Hi mortuis soulless creaturas, imo monstra adventus vultus comedat cerebella viventium. Qui offenderit rapto, terribilem incessu. The voodoo sacerdos suscitat mortuos comedere carnem. Search for solum oculi eorum defunctis cerebro. Nescio an Undead zombies. Sicut malus movie horror.',
  rating: 4,
  capacity: 20,
  price: 0
})

Activity.create!({
  user: User.first,
  title: 'Swimming lessons in the lake',
  address: 'Eiriks gate 2, Oslo',
  duration: 1,
  date: Time.now,
  description: 'Zombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro. De carne lumbering animata corpora quaeritis. Summus brains sit​​, morbo vel maleficia? De apocalypsi gorger omero undead survivor dictum mauris. Hi mindless mortuis soulless creaturas, imo evil stalking monstra adventus resi dentevil vultus comedat cerebella viventium. Qui animated corpse, cricket bat max brucks terribilem incessu zomby. The voodoo sacerdos flesh eater, suscitat mortuos comedere carnem virus. Zonbi tattered for solum oculi eorum defunctis go lum cerebro. Nescio brains an Undead zombies. Sicut malus putrid voodoo horror. Nigh tofth eliv ingdead.',
  rating: 3,
  capacity: 50,
  price: 150
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
  price: 300
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
  price: 100
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
  price: 0
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
  price: 250
})

puts "created #{Activity.count} activities"
