# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  puts "Destroying gardens and plants..."
  # We just need to destroy gardens to also destroy plants.
  # This is possible thanks to the dependent: :destroy in the Garden model.
  # It will automatically destroy all the plants of each garden before destroying
  # the garden itself.
  Garden.destroy_all

  puts "Creating gardens..."

  Garden.create!(
    name: "My Little Garden",
    banner_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_1.jpg"
  )

  Garden.create!(
    name: "My Other Garden",
    banner_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_2.jpg"
  )

  puts "Creating plants..."

  Plant.create!(
    name: 'Dieffenbachia',
    image_url: 'https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/plants/dieffenbachia.jpg',
    garden: Garden.first
  )
  Plant.create!(
    name: 'Monstera',
    image_url: 'https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/plants/monstera.jpg',
    garden: Garden.first
  )
  Plant.create!(
    name: 'Caryota',
    image_url: 'https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/plants/caryota.jpg',
    garden: Garden.second
  )

  puts "Seeds are done!"
end
