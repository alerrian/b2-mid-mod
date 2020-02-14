require 'rails_helper'

RSpec.describe 'as a user', type: :feature do
  describe 'when I visit movie show page' do
    before :each do
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

      @disney_movie3 = Movie.create!(
        name: 'The Last Jedi',
        year: '2016',
        genre: 'Sci-Fi',
        studio_id: @disney.id
      )
      @actor1 = Actor.create!(name: 'Mark Hamill', age: 68)
      @actor2 = Actor.create!(name: 'Liam Neeson', age: 60)
      @actor3 = Actor.create!(name: 'Daisy Ridley', age: 25)
      @actor4 = Actor.create!(name: 'Ewan McGregor', age: 48)

      MovieActor.create!(actor_id: @actor1.id, movie_id: @lucasfilm_movie2.id)
      MovieActor.create!(actor_id: @actor2.id, movie_id: @lucasfilm_movie1.id)
      MovieActor.create!(actor_id: @actor4.id, movie_id: @lucasfilm_movie1.id)
      MovieActor.create!(actor_id: @actor3.id, movie_id: @disney_movie2.id)
      MovieActor.create!(actor_id: @actor3.id, movie_id: @disney_movie3.id)
    end

    it 'can see information about a movie' do
      visit "/movies/#{@lucasfilm_movie1.id}"

      within "#movie_info" do
        expect(page).to have_content('The Phantom Menace')
        expect(page).to have_content('1999')
        expect(page).to have_content('Sci-Fi')
      end
    end

    it 'can see actors in movie' do
      visit "/movies/#{@lucasfilm_movie1.id}"

      within "#movie_actors" do
        expect(page).to have_content('Ewan McGregor')
        expect(page).to have_content('Liam Neeson')
      end
    end

    it 'can see average age of actors' do
      visit "/movies/#{@lucasfilm_movie1.id}"

      within "#average_actor_age" do
        expect(page).to have_content(54)
      end
    end
  end
end
