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
brice_profile = ProfileSitter.create( description: "J'adore les animaux ce sont des êtres vraiment indispensables pour moi. Je me donne à fond pour subvenir à leurs besoins et maintenir leur sécurité en tout temps.Je suis quelqu'un de très sportif et très calme.J'aime la cuisine, le cinéma, l'animation japonaise et la musique et bien sûr nos boules de poils!", address: '16 villa gaudelet 75011 Paris', price: 15, user: brice, start_date: '2021-11-16', end_date: '2021-12-03')
sixtine_profile = ProfileSitter.create( description: "Voulant gagner mon petit argent, je souhaiterai méler cela à l'agréable, tout autant pour les animaux que pour moi. Je saurais traiter votre animal avec attention et beaucoup de patience pour qu'il se sente au mieux. J'espère pouvoir m'amuser avec lui également et que mon temps passé en sa compagnie, même court, lui sera agréable. ", address: '21 rue de la pompe 75016 Paris', user: sixtine, price: 20, start_date: '2021-12-03', end_date: '2021-12-15')
nicolas_profile = ProfileSitter.create( description: "Durant mon enfance mes parents m'ont offert un chat, et depuis je suis tombé amoureux des animaux. Pendant les vacances estivales je garde régulièrement les animaux de mes amis ( chat, poisson, lapin ). Je peux accueillir à la maison que des animaux de petites tailles, car la surface de mon appartement est réduite ( 20 m2), les animaux n'y seraient pas à l'aise.", address: '29 Bis rue des Francs Bourgois 75004 Paris', user: nicolas, price: 15, start_date: '2022-01-03', end_date: '2022-02-15')
lilas_profile = ProfileSitter.create( description: "Patiente et déterminer, prête à suivre vos consignes propre à chacun de vos p'tites boules de poils, je serai une petsitter à l'écoute des besoins et du bien-être de votre animal.Je serai ravie d'échanger avec vous. J'ai hâte de pouvoir rencontrer votre petite (ou moins petite) boule de poils !", address: '3 Rue Geoffroy l\'Angevin 75004 Paris', user: lilas, price: 30, start_date: '2022-02-03', end_date: '2022-03-15')
john_profile = ProfileSitter.create( description: "Dispo les week-ends pour garder vos chiens, ils seront en sécurité avec moi", address: '12 rue du Faubourg Saint-Martin 75010 Paris', user: john, price: 100, start_date: '2021-11-26', end_date: '2021-11-28')
john2_profile = ProfileSitter.create( description: "Je possède une île et je suis chaud pour garder vos raptors tout l'hiver. De grandes étendues d'herbe où ils pourront se dépenser sans compter", address: '16 villa Gaudelet 75011 Paris', user: john2, price: 200, start_date: '2021-11-19', end_date: '2022-07-15')
laurene_profile = ProfileSitter.create( description: "dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam", address: '110 Rue Oberkampf 75011 Paris', user: laurene, price: 10, start_date: '2021-11-25', end_date: '2022-11-25')

puts 'Creating bookings'
Booking.create(user: brice, profile_sitter: sixtine_profile, status: 'No answer', start_date: '2021-12-03', end_date: '2021-12-06')
Booking.create(user: sixtine, profile_sitter: nicolas_profile, status: 'Decline', start_date: '2021-12-03', end_date: '2021-12-15')
Booking.create(user: nicolas, profile_sitter: lilas_profile, status: 'Accepted', start_date: '2022-01-03', end_date: '2022-02-15')
Booking.create(user: lilas, profile_sitter: brice_profile, status: 'No answer', start_date: '2022-02-03', end_date: '2022-03-15')
Booking.create(user: nicolas, profile_sitter: john_profile, status: 'Accepted', start_date: '2021-11-27', end_date: '2021-11-28')
Booking.create(user: brice, profile_sitter: john2_profile, status: 'Accepted', start_date: '2021-11-21', end_date: '2022-03-03')

puts 'This is the end..'
