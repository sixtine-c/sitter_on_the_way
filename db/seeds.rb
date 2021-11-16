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

puts 'Creating profile sitter'
brice_profile = ProfileSitter.create( description: 'profile sitter 1', address: '16 villa gaudelet 75011 Paris', user: brice, start_date: '2021-11-16', end_date: '2021-12-03')
sixtine_profile = ProfileSitter.create( description: 'profile sitter 2', address: '21 rue de la pompe 75016 Paris', user: sixtine, start_date: '2021-12-03', end_date: '2021-12-15')
nicolas_profile = ProfileSitter.create( description: 'profile sitter 3', address: '29 Bis rue des Francs Bourgois 75004 Paris', user: nicolas, start_date: '2022-01-03', end_date: '2022-02-15')
lilas_profile = ProfileSitter.create( description: 'profile sitter 4', address: '3 Rue Geoffroy l\'Angevin 75004 Paris', user: lilas, start_date: '2022-02-03', end_date: '2022-03-15')

puts 'Creating bookings'
Booking.create(user: brice, profile_sitter: sixtine_profile, status: 'No answer', start_date: '2021-11-16', end_date: '2021-12-03')
Booking.create(user: sixtine, profile_sitter: nicolas_profile, status: 'Decline', start_date: '2021-12-03', end_date: '2021-12-15')
Booking.create(user: nicolas, profile_sitter: lilas_profile, status: 'Accepted', start_date: '2022-01-03', end_date: '2022-02-15')
Booking.create(user: lilas, profile_sitter: brice_profile, status: 'No answer', start_date: '2022-02-03', end_date: '2022-03-15')

puts 'This is the end..'
