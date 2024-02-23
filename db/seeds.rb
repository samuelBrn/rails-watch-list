# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

POSTERS = %w[https://media.senscritique.com/media/000012288077/300/pulp_fiction.jpg https://media.senscritique.com/media/000012235164/300/apocalypse_now.jpg https://media.senscritique.com/media/000006352793/300/the_grand_budapest_hotel.jpg https://media.senscritique.com/media/000007044334/300/under_the_skin.jpg https://media.senscritique.com/media/000004876963/300/le_silence_des_agneaux.jpg https://media.senscritique.com/media/000019230851/300/2001_l_odyssee_de_l_espace.jpg https://media.senscritique.com/media/000021564602/300/les_dents_de_la_mer.png]

puts "Destroying all movies"
Movie.destroy_all

puts "Creating movies"
10.times do
  movie = Movie.new({
    title: Faker::Movie.title,
    overview: Faker::Movie.quote,
    poster_url: POSTERS.sample,
    rating: Faker::Number.within(range: 0.0..10.0),
  })
  movie.save!
  puts "#{movie.title} created!"
end
puts "Creation finished"
