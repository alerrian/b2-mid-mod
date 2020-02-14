# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@disney = Studio.create!(
  name: 'Disney'
)
@lucasfilm = Studio.create!(
  name: 'Lucasfilm'
)

@disney_movie1 = Movie.create!(
  name: 'Snow White',
  year: '1935',
  genre: 'cartoon',
  studio_id: @disney.id
)

@lucasfilm_movie1 = Movie.create!(
  name: 'The Phantom Menace',
  year: '1999',
  genre: 'Sci-Fi',
  studio_id: @lucasfilm.id
)

@lucasfilm_movie2 = Movie.create!(
  name: 'A New Hope',
  year: '1978',
  genre: 'Sci-Fi',
  studio_id: @lucasfilm.id
)

@disney_movie2 = Movie.create!(
  name: 'The Force Awakens',
  year: '2014',
  genre: 'Sci-Fi',
  studio_id: @disney.id
)

@actor1 = Actor.create!(
  name: 'Mark Hamill',
  age: 68
)

@actor2 = Actor.create!(
  name: 'Liam Neeson',
  age: 60
)

@actor3 = Actor.create!(
  name: 'Daisy Ridley',
  age: 25
)

@actor4 = Actor.create!(
  name: 'Ewan McGregor',
  age: 48
)

MovieActor.create!(actor_id: @actor1.id, movie_id: @lucasfilm_movie2.id)
MovieActor.create!(actor_id: @actor2.id, movie_id: @lucasfilm_movie1.id)
MovieActor.create!(actor_id: @actor4.id, movie_id: @lucasfilm_movie1.id)
MovieActor.create!(actor_id: @actor3.id, movie_id: @disney_movie2.id)
