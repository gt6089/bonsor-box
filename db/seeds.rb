# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = 'secret'
ROUND_DURATION = 2_592_000

puts '***** BEGIN SEEDING ******'

# create admin
admin = Player.create(first_name: 'Admin', last_name: 'Kealy', email: 'admin@bonsorbox.com', phone: Faker::PhoneNumber.cell_phone, admin: true, password: PASSWORD)
puts "Created admin: #{admin.inspect}"

# create active players
10.times do
  player = Player.create(first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, password: PASSWORD)
  puts "Created active player: #{player.inspect}"
end

# create inactive players
2.times do
  player = Player.create(first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, active: false, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, password: PASSWORD)
  puts "Created inactive player: #{player.inspect}"
end

# create current round
round = Round.create(start_time: Date.current - 10.days, duration: ROUND_DURATION)
puts "Created current round: #{round.inspect}"

# create future rounds
3.times do |r|
  # 30 days in seconds is 2,592,000
  round = Round.create(start_time: Round.last.end_time + 1.days, duration: ROUND_DURATION)
  puts "Created round: #{round.inspect}"
end

# create boxes
Round.all.each do |r|
  RoundManager.new(r).start!
  puts "Created assignments for round #{r.start_time}"
end

puts '***** FINISHED SEEDING ******'