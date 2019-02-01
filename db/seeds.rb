# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = 'secret'

puts "***** BEGIN SEEDING ******"

# create admin
admin = Player.create(first_name: 'Admin', last_name: 'Kealy', email: 'admin@bonsorbox.com', phone: Faker::PhoneNumber.cell_phone, admin: true, password: PASSWORD)
puts "Created admin: #{admin.inspect}"

# create players
10.times do
  player = Player.create(first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, password: PASSWORD)
  puts "Created player: #{player.inspect}"
end

# create rounds
3.times do |r|
  # 30 days in seconds is 2,592,000
  round = Round.create(start_date: Date.today + (r*30).days, duration: 2592000)
  puts "Created round: #{round.inspect}"
end

puts "***** FINISHED SEEDING ******"