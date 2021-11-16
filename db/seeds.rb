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
brice_profile = ProfileSitter.create( description: 'profile sitter 1', addess: '16 villa gaudelet 75011 Paris', user_id: brice.id, start_date: '2021-11-16', end_date: '2021-12-03')
sixtine_profile = ProfileSitter.create( description: 'profile sitter 2', addess: '21 rue de la pompe 75016 Paris', user_id: sixtine.id, start_date: '2021-12-03', end_date: '2021-12-15')
nicolas_profile = ProfileSitter.create( description: 'profile sitter 3', addess: '29 Bis rue des Francs Bourgois 75004 Paris', user_id: nicolas.id, start_date: '2022-01-03', end_date: '2022-02-15')
lilas_profile = ProfileSitter.create( description: 'profile sitter 4', addess: '3 Rue Geoffroy l\'Angevin 75004 Paris', user_id: lilas.id, start_date: '2022-02-03', end_date: '2022-03-15')

puts 'Creating bookings'
Booking.create(user_id: brice.id, profile_sitter_id: brice_profile.id, status: 'No answer', start_date: '2021-11-16', end_date: '2021-12-03')
Booking.create(user_id: sixtine.id, profile_sitter_id: sixtine_profile.id, status: 'Decline', start_date: '2021-12-03', end_date: '2021-12-15')
Booking.create(user_id: nicolas.id, profile_sitter_id: nicolas_profile.id, status: 'Accepted', start_date: '2022-01-03', end_date: '2022-02-15')
Booking.create(user_id: lilas.id, profile_sitter_id: lilas_profile.id, status: 'No answer', start_date: '2022-02-03', end_date: '2022-03-15')

puts 'End...'
