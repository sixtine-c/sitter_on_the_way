# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed user

puts 'destroying everything'
Booking.destroy_all
ProfileSitter.destroy_all
User.destroy_all

puts 'Creating users'
brice = User.create(first_name: 'Brice', last_name: 'Adjivon', email: 'brice@lewagon.com', password: 'jesuisBrice', password_confirmation: 'jesuisBrice')
sixtine = User.create(first_name: 'Sixtine', last_name: 'Caspar', email: 'sixtine@lewagon.com', password: 'jesuisSixtine', password_confirmation: 'jesuisSixtine')
nicolas = User.create(first_name: 'Nicolas', last_name: 'Bischoff', email: 'nicolas@lewagon.com', password: 'jesuisNicolas', password_confirmation: 'jesuisNicolas')
lilas = User.create(first_name: 'Lilas', last_name: 'Marchand', email: 'lilas@lewagon.com', password: 'jesuisLilas', password_confirmation: 'jesuisLilas')
john = User.create(first_name: 'John', last_name: 'Wick', email: 'johnwick@lewagon.com', password: 'jesuisJohn', password_confirmation: 'jesuisJohn')
john2 = User.create(first_name: 'John', last_name: 'Hammond', email: 'johnhammond@lewagon.com', password: 'jesuisJohn', password_confirmation: 'jesuisJohn')
laurene = User.create(first_name: 'Laurène', last_name: 'Hipsoume', email: 'laurenehipsoume@lewagon.com', password: 'jesuisLaurene', password_confirmation: 'jesuisLaurene')

puts 'Creating profile sitter'
brice_profile = ProfileSitter.create( description: "I love animals, they are really indispensable to me. I give my all to provide for them and keep them safe at all times, I am a very sporty and calm person. I love cooking, movies, Japanese animation and music and of course our furry friends!", address: '16 villa gaudelet 75011 Paris', price: 15, user: brice, start_date: '2021-11-16', end_date: '2021-12-03')
sixtine_profile = ProfileSitter.create( description: "Wanting to earn my own money, I would like to mix it with pleasure, as much for the animals as for me. I will be able to treat your pet with attention and a lot of patience so that it feels better. I hope to have fun with him too and that my time spent in his company, even if short, will be pleasant. ", address: '21 rue de la pompe 75016 Paris', user: sixtine, price: 20, start_date: '2021-12-03', end_date: '2021-12-15')
nicolas_profile = ProfileSitter.create( description: "During my childhood my parents gave me a cat, and since then I fell in love with animals. During the summer vacations I regularly look after my friends' animals (cat, fish, rabbit). I can only welcome small animals at home, because the surface of my apartment is small (20 m2), animals would not be at ease there.", address: '29 Bis rue des Francs Bourgois 75004 Paris', user: nicolas, price: 15, start_date: '2022-01-03', end_date: '2022-02-15')
lilas_profile = ProfileSitter.create( description: "Patient and determined, ready to follow your instructions specific to each of your little furballs, I will be a petsitter listening to the needs and well-being of your pet, I will be delighted to exchange with you. I look forward to meeting your little (or not so little) fur ball!", address: '3 Rue Geoffroy l\'Angevin 75004 Paris', user: lilas, price: 30, start_date: '2022-02-03', end_date: '2022-03-15')
john_profile = ProfileSitter.create( description: "Available on weekends to keep your dogs, they will be safe with me", address: '12 rue du Faubourg Saint-Martin 75010 Paris', user: john, price: 100, start_date: '2021-11-26', end_date: '2021-11-28')
john2_profile = ProfileSitter.create( description: "I own an island and I am warm to keep your raptors all winter long. Big grassy areas where they can spend themselves without counting", address: '16 villa Gaudelet 75011 Paris', user: john2, price: 200, start_date: '2021-11-19', end_date: '2022-07-15')
laurene_profile = ProfileSitter.create( description: "dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam", address: '110 Rue Oberkampf 75011 Paris', user: laurene, price: 10, start_date: '2021-11-25', end_date: '2022-11-25')

puts 'Creating bookings'
Booking.create(user: brice, profile_sitter: sixtine_profile, status: 'No answer', start_date: '2021-12-03', end_date: '2021-12-06')
Booking.create(user: sixtine, profile_sitter: nicolas_profile, status: 'Decline', start_date: '2021-12-03', end_date: '2021-12-15')
Booking.create(user: nicolas, profile_sitter: lilas_profile, status: 'Accepted', start_date: '2022-01-03', end_date: '2022-02-15')
Booking.create(user: lilas, profile_sitter: brice_profile, status: 'No answer', start_date: '2022-02-03', end_date: '2022-03-15')
Booking.create(user: nicolas, profile_sitter: john_profile, status: 'Accepted', start_date: '2021-11-27', end_date: '2021-11-28')
Booking.create(user: brice, profile_sitter: john2_profile, status: 'Accepted', start_date: '2021-11-21', end_date: '2022-03-03')

puts 'This is the end..'
