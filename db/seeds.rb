require 'faker'

puts 'Cleaning the database...'
Restaurant.destroy_all

puts 'Creating restaurants...'

100.times do |number|
  
  Restaurant.create!(
    name: Faker::Movies::StarWars.planet,
    address: Faker::Movies::StarWars.call_sign,
    rating: rand(0..5),
    chef_name: Faker::Movies::StarWars.character
  )

  puts "Created restaurant number: #{number + 1}"
end

puts 'Finished creating the restaurants!'