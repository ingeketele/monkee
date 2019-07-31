# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'cleaning database'
Favorite.destroy_all
Activity.destroy_all
User.destroy_all

puts 'creating users'

User.create!({
  first_name: 'Alfred',
  last_name: 'Larvik',
  email: 'him@gmail.com',
  password: '123456',
  remote_avatar_url: 'https://images.unsplash.com/photo-1505503693641-1926193e8d57?ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80',
  address: 'Thorvald Meyers gate 26C, 0555 Oslo, Norway'
})

User.create!({
  first_name: 'Sara',
  last_name: 'Olsen',
  email: 'her@gmail.com',
  password: '123456',
  remote_avatar_url: 'https://images.unsplash.com/photo-1561406636-b80293969660?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  address: 'Sofies gate 16, 0170 Oslo, Norway'
})

User.create!({
  first_name: 'Inge',
  last_name: 'Ketele',
  email: 'ingeketele@gmail.com',
  password: 'password',
  remote_avatar_url: 'https://avatars0.githubusercontent.com/u/49438450?v=4',
  address: 'Birchs vei 7, 3530 Røyse, Norway'
})

User.create!({
  first_name: 'Arne',
  last_name: 'Lamo',
  email: 'arnelamo@gmail.com',
  password: 123456,
  remote_avatar_url: 'https://avatars2.githubusercontent.com/u/48482148?v=4',
  address: 'Youngs gate 6, 0181 Oslo, Norway'
})

User.create!({
  first_name: 'Manuel',
  last_name: 'Velasco',
  email: 'velascome@gmail.com',
  password: 123456,
  remote_avatar_url: 'https://avatars2.githubusercontent.com/u/50828958?v=4',
  address: 'Sørligata 40, 0181 Oslo, Norway'
})

puts "created #{User.count} users"

puts 'creating activities'

Activity.create!({
  user: User.find_by(first_name: 'Alfred'),
  title: 'Via Ferrata',
  address: 'Jøssingfjord, Sokndal',
  date: '15 Aug 2019 10:00',
  duration: 4,
  description: 'Via Ferrata is a climbing route along the mountain. It has been given the name Migaren after the waterfall you need to cross along the way. The hike/climb goes partly along bolts and anchors in the mountain. Via Ferrata means walking on iron and is a name commonly used for these types of climbs in other countries as well. You will get instructions in advance. Migaren is a 400 metres Via Ferrata that winds along the mountainside and through a waterfall in Jøssingfjord. The climb is easy, but will still give you a sense of a challenging climbing adventure. There is no need for any climbing experience on this route when you go with instructors on the climb, although if you want to climb it alone,  you need a climbing pass (in Norway it is called Brattkort) or some kind of climbing experience. Equipment needed is a climbing harness, helmet and a Via Ferrata sling. ',
  capacity: 20,
  price: 350,
  category: "Outdoors",
  age_group: "+9 years"
})

ActivityImage.create!({
  activity: Activity.find_by(title: 'Via Ferrata'),
  remote_photo_url: 'https://assets.simpleviewcms.com/simpleview/image/fetch/c_fill,f_jpg,h_605,q_65,w_1200/https://media.newmindmedia.com/TellUs/image/%3Ffile%3DC28FE588332DE444DF4C8FDA0116D19CCC6F30FA.jpg%26dh%3D536%26dw%3D800%26t%3D4'
})

ActivityImage.create!({
  activity: Activity.find_by(title: 'Via Ferrata'),
  remote_photo_url: 'https://2fojj5bdzo736mcp62k4ij61-wpengine.netdna-ssl.com/wp-content/uploads/2016/09/tomknudsen_vf_brokke_12-640x561.jpg'
})

Activity.create!({
  user: User.find_by(first_name: 'Sara'),
  title: 'Drøbak Akvarium',
  address: 'Havnegaten 4, Frogn',
  date: '25 July 2019 12:00',
  duration: 3,
  description: 'Drøbak Aquarium will display the rich wildlife of the Oslo fjord at close range. In the Aquarium you will find a total of 14 aquariums, 2 large tanks and a "touch pool" with different kinds of species from the sea. The aquarium has many interesting species to show you, among other things, you can get close to the mysterious deep sea eels Morgan and see that terrifying grin of the catfish Hugo. In our aquariums will find everything from sweet scallops to ghostly cods. In some aquariums there are also sharks!',
  capacity: 20,
  price: 200,
  category: "Indoors",
  age_group: "For all"
})

ActivityImage.create!({
  activity: Activity.find_by(title: 'Drøbak Akvarium'),
  remote_photo_url: 'https://images.unsplash.com/photo-1489015712802-f490a7a1061d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1651&q=80'
})

ActivityImage.create!({
  activity: Activity.find_by(title: 'Drøbak Akvarium'),
  remote_photo_url: 'https://images.unsplash.com/photo-1559407108-636cc610a3c9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60'
})

Activity.create!({
  user: User.find_by(first_name: 'Inge'),
  title: 'Hadeland Glassverk',
  address: '3520 Jevnaker',
  duration: 2,
  date: '28 July 2019 10:00',
  description: 'Hadeland Glassverk is beautifully situated just an hour north of Oslo, in idyllic surroundings on the south bank of Lake Randsfjord. The glassworks was founded in 1762 and is the oldest industrial company in Norway, still going strong. The Visitor Centre is open daily throughout the year, Monday through Sunday, and offers a variety of activities for children and adults alike. Watch the glassblowers practicing their traditional art, and try your hand at glassblowing or glass designing. Everything is in place for a successful conference or event. Our historical surroundings, excellent catering and the creative activities, will make every event one to remember. At Hadeland Glassverk, you can arrange everything from conferences, executive get-togethers, exhibitions and fairs to summer celebrations and Christmas dinners. Our historic buildings house modern conference facilities. We offer excellent catering based on Norwegian culinary traditions. Buying crystal at factory prices is popular among attendees. There are a number of accommodation facilities nearby. ',
  capacity: 50,
  price: 100,
  category: "Creative",
  age_group: "For all"
})

ActivityImage.create!({
  activity: Activity.find_by(title: 'Hadeland Glassverk'),
  remote_photo_url: 'https://trenorske.wpcloud.trollweb.no/hg/wp-content/wpcloud_cache/imageintervention/3/xblaseglass_kvadrat-647350231.jpg.pagespeed.ic.9-B8OnVa3r.jpg'
})

ActivityImage.create!({
  activity: Activity.find_by(title: 'Hadeland Glassverk'),
  remote_photo_url: 'https://norge.sandalsand.net/wp-content/uploads/ngg_featured/2015-08_0735.jpg'
})

Activity.create!({
  user: User.find_by(first_name: 'Manuel'),
  title: 'Tusenfryd',
  address: 'Vinterbro, Norway',
  date: '17 Aug 2019 13:00',
  duration: 4,
  description: 'Tusenfryd is an amusement park at Vinterbro, Norway. The park is located 20 kilometers south of Oslo. Two of the longest motorway corridors in Norway, E6 and E18, meet nearby Tusenfryd and the park is located on the west side near where they meet.',
  capacity: 100,
  price: 400,
  category: "Outdoors",
  age_group: "+9 years"
})

ActivityImage.create!({
  activity: Activity.find_by(title: 'Tusenfryd'),
  remote_photo_url: 'http://www.vg.no/annonsorinnhold/familieliv/uploads/articles/covers/large_28ceb0397b0b5f8efc4ba2612029c0be2f21da10.jpg'
})

Activity.create!({
  user: User.find_by(first_name: 'Arne'),
  title: "Kid's Farm Hunderfossen",
  address: 'Fåberg, Lillehammer',
  date: '21 Sept 2019 13:00',
  duration: 4,
  description: 'The farm features Norwegian farm animals – both small and large. In total 23 different species. Be prepared for a close encounter with the animals. Do you like animals? Visit our charming smallholding from 1750. Here you can pet and cuddle with the animals. Maybe the kids want to try feeding the animals themselves? The farm features Norwegian farm animals – both small and large – and a genuine fox! There is also a duck pond, a playground for the kids and a cafe serving snacks. The Children’s Farm is open during the norwegian school holiday, from end of june until end of August. The farm is located just a 300 metres from the Hunderfossen Family Park. Prepurchase of admission tickets can be done at our website www.barnasgard.no Welcome!',
  capacity: 50,
  price: 100,
  category: "Outdoors",
  age_group: "3-5 years"
})

ActivityImage.create!({
  activity: Activity.find_by(title: "Kid's Farm Hunderfossen"),
  remote_photo_url: 'https://assets.simpleviewcms.com/simpleview/image/fetch/c_limit,f_jpg,q_64,w_1200/https://media.newmindmedia.com/TellUs/image/%3Ffile%3DDSC04686_copy_crop_1676446643.jpg%26dh%3D800%26dw%3D1200%26t%3D4&.jpg'
})

ActivityImage.create!({
  activity: Activity.find_by(title: "Kid's Farm Hunderfossen"),
  remote_photo_url: 'https://images.unsplash.com/photo-1500595046743-cd271d694d30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1653&q=80'
})

ActivityImage.create!({
  activity: Activity.find_by(title: "Kid's Farm Hunderfossen"),
  remote_photo_url: 'https://www.farmholidays.com/uploads/media/1200x630/07/1017-uab_bv_kinder-mit-kaninchen_01.jpg?v=1-1'
})

Activity.create!({
  user: User.find_by(first_name: 'Alfred'),
  title: 'Football games 5x5 at local Jens Park',
  address: 'Sørligata 40, Oslo',
  date: '01 Aug 2019 15:00',
  duration: 1,
  description: 'Challenge your friends and build a team to play in local tournament',
  capacity: 60,
  price: 0,
  category: "Outdoors",
  age_group: "6-9 years"
})

ActivityImage.create!({
  activity: Activity.find_by(title: "Football games 5x5 at local Jens Park"),
  remote_photo_url: 'https://images.unsplash.com/photo-1524844972719-9ed0d97562e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'
})

Activity.create!({
  user: User.find_by(first_name: 'Sara'),
  title: 'Day at the museum, Nature in Art',
  address: 'Sørligata 40, Oslo',
  date: '01 Aug 2019 12:00',
  duration: 2,
  description: 'Come discover Nature through beautiful paintings',
  capacity: 50,
  price: 250,
  category: "Culture",
  age_group: "For all"
})

Activity.create!({
  user: User.find_by(first_name: 'Sara'),
  title: 'Local Football Tournament !',
  address: 'Havnegaten 4, Frogn',
  date: '29 July 2019 09:00',
  duration: 8,
  description: 'Come challenge all your friends in a great local football tournament! 5 side team tournament over 2 days with great fun and goodies. Everyone is welcomed and a surprise will join us to talk about football values and respect. Stay tune and spread the word!',
  capacity: 200,
  price: 15,
  category: "Outdoors",
  age_group: "For all"
})


Activity.create!({
  user: User.find_by(first_name: 'Sara'),
  title: 'Dancing classes',
  address: 'Havnegaten 4, Frogn',
  date: '30 Aug 2019 17:00',
  duration: 2,
  description: 'Ut tincidunt ut odio ut rhoncus. Morbi congue ultricies libero nec tempor. Aliquam feugiat metus varius accumsan luctus. Fusce dignissim lectus sed elit sodales, vel porta ex maximus. Nullam sed lacus at enim cursus consequat non ac libero. Curabitur ac dictum metus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc ac justo posuere, consectetur nunc quis, congue sem. Aenean ipsum velit, vehicula vel eros eu, congue rhoncus quam. Nam sit amet iaculis tortor, sit amet maximus dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;',
  capacity: 30,
  price: 130,
  category: "Music & Dance",
  age_group: "For all"
})

Activity.create!({
  user: User.find_by(first_name: 'Sara'),
  title: 'Childrens Organic Animal Farm (Kampen Barnebondegård)',
  address: 'Skedsmogata 23, 0655 Oslo',
  date: '25 July 2019 10:00',
  duration: 5,
  description: 'Ut tincidunt ut odio ut rhoncus. Morbi congue ultricies libero nec tempor. Aliquam feugiat metus varius accumsan luctus. Fusce dignissim lectus sed elit sodales, vel porta ex maximus. Nullam sed lacus at enim cursus consequat non ac libero. Curabitur ac dictum metus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc ac justo posuere, consectetur nunc quis, congue sem. Aenean ipsum velit, vehicula vel eros eu, congue rhoncus quam. Nam sit amet iaculis tortor, sit amet maximus dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;',
  capacity: 100,
  price: 75,
  category: "Farm Day",
  age_group: "For all"
})

ActivityImage.create!({
  activity: Activity.find_by(title: "Childrens Organic Animal Farm (Kampen Barnebondegård)"),
  remote_photo_url: 'https://unsplash.com/photos/xMh_ww8HN_Q'
})

ActivityImage.create!({
  activity: Activity.find_by(title: "Local Football Tournament !"),
  remote_photo_url: 'https://unsplash.com/photos/_AOL4_fDQ3M'
})


ActivityImage.create!({
  activity: Activity.find_by(title: "Dancing classes"),
  remote_photo_url: 'https://unsplash.com/photos/7fcSXSU-zhY'
})

ActivityImage.create!({
  activity: Activity.find_by(title: "Day at the museum, Nature in Art"),
  remote_photo_url: 'https://images.unsplash.com/photo-1547049136-c1c89cc60c55?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'
})

ActivityImage.create!({
  activity: Activity.find_by(title: "Day at the museum, Nature in Art"),
  remote_photo_url: 'https://images.unsplash.com/photo-1506845347893-bc5faede1eec?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'
})

puts "created #{Activity.count} activities"

arne_order = Order.create!({
  user: User.find_by(first_name: 'Arne'),
  activity: Activity.find_by(title: 'Drøbak Akvarium'),
  number_of_tickets: 4
})

ActivityReview.create!({
  order: arne_order,
  rating: 4,
  comment: 'We had a beautiful day in Drøbak. The whole family enjoyed it. Monkee really made it easy for us to decide on what to do this weekend!'
})

inge_order = Order.create!({
  user: User.find_by(first_name: 'Inge'),
  activity: Activity.find_by(title: "Kid's Farm Hunderfossen"),
  number_of_tickets: 3
})

ActivityReview.create!({
  order: inge_order,
  rating: 5,
  comment: 'We enjoyed our day very much at the Kids Farm in Hunderfossen. Perfect for our little girl. Was really easy to book with Monkee!'
})

manuel_order = Order.create!({
  user: User.find_by(first_name: 'Manuel'),
  activity: Activity.find_by(title: 'Football games 5x5 at local Jens Park'),
  number_of_tickets: 4
})

ActivityReview.create!({
  order: manuel_order,
  rating: 5,
  comment: "This was a really cool idea. Because of Monkee we were able to connect with people from the neighbourhood that we didn't know! Our kids had a great day being outside, and us parents made new friends too. Thanks Alfred and Monkee, I hope you organize this event soon again."
})

puts "created #{Order.count} orders"
