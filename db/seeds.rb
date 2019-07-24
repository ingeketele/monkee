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
  description: 'Zombie ipsum brains reversus ab cerebellum viral inferno, brein nam rick mend grimes malum cerveau cerebro. De carne cerebro lumbering animata cervello corpora quaeritis. Summus thalamus brains sit​​, morbo basal ganglia vel maleficia? De braaaiiiins apocalypsi gorger omero prefrontal cortex undead survivor fornix dictum mauris. Hi brains mindless mortuis limbic cortex soulless creaturas optic nerve, imo evil braaiinns stalking monstra hypothalamus adventus resi hippocampus dentevil vultus brain comedat cerebella pitiutary gland viventium. Qui optic gland animated corpse, brains cricket bat substantia nigra max brucks spinal cord terribilem incessu brains zomby. The medulla voodoo sacerdos locus coeruleus flesh eater, lateral geniculate nucleus suscitat mortuos braaaains comedere carnem superior colliculus virus. Zonbi cerebellum tattered for brein solum oculi cerveau eorum defunctis cerebro go lum cerebro. Nescio brains an Undead cervello zombies. Sicut thalamus malus putrid brains voodoo horror. Nigh basal ganglia tofth eliv ingdead.

',
  rating: 5,
  capacity: 200,
  duration: 2
})

Activity.create!({
  user: User.first,
  title: 'Tour to the forest',
  address: 'Torggata 1, Oslo',
  date: Time.now,
  duration: 3,
  description: 'Zombies reversus ab inferno, nam malum cerebro. De carne animata corpora quaeritis. Summus sit​​, morbo vel maleficia? De Apocalypsi undead dictum mauris. Hi mortuis soulless creaturas, imo monstra adventus vultus comedat cerebella viventium. Qui offenderit rapto, terribilem incessu. The voodoo sacerdos suscitat mortuos comedere carnem. Search for solum oculi eorum defunctis cerebro. Nescio an Undead zombies. Sicut malus movie horror.

',
  rating: 4,
  capacity: 20,
  duration: 3
})

Activity.create!({
  user: User.first,
  title: 'Swimming lessons in the lake',
  address: 'Sognsvann, Oslo',
  date: Time.now,
  duration: 6,
  description: 'Zombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro. De carne lumbering animata corpora quaeritis. Summus brains sit​​, morbo vel maleficia? De apocalypsi gorger omero undead survivor dictum mauris. Hi mindless mortuis soulless creaturas, imo evil stalking monstra adventus resi dentevil vultus comedat cerebella viventium. Qui animated corpse, cricket bat max brucks terribilem incessu zomby. The voodoo sacerdos flesh eater, suscitat mortuos comedere carnem virus. Zonbi tattered for solum oculi eorum defunctis go lum cerebro. Nescio brains an Undead zombies. Sicut malus putrid voodoo horror. Nigh tofth eliv ingdead.

',
  rating: 3,
  capacity: 50,
  duration: 2
})

puts "created #{Activity.count} activities"
puts "Created #{User.count} users and #{Activity.count} activities"
