require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do
  describe 'when I visit a movie show page' do
    before :each do
      @disney = Studio.create!(name: 'Disney')
      @lucasfilm = Studio.create!(name: 'Lucasfilm')

      @disney_movie1 = Movie.create!(name: 'Snow White', year: '1935', genre: 'cartoon', studio_id: @disney.id)
      @lucasfilm_movie1 = Movie.create!(name: 'The Phantom Menace', year: '1999', genre: 'Sci-Fi', studio_id: @lucasfilm.id)
      @lucasfilm_movie2 = Movie.create!(name: 'A New Hope', year: '1978', genre: 'Sci-Fi', studio_id: @lucasfilm.id)
      @disney_movie2 = Movie.create!(name: 'The Force Awakens', year: '2014', genre: 'Sci-Fi', studio_id: @disney.id)
      @disney_movie3 = Movie.create!(name: 'The Last Jedi', year: '2016', genre: 'Sci-Fi', studio_id: @disney.id)

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

    it 'can fill out a form to add an actors name' do
      visit "/movies/#{@lucasfilm_movie1.id}"

      within '#actor_name_form' do
        fill_in :actor_name, with: 'Hayden Christensen'

        click_on 'Submit Name'

        expect(current_path).to eq("/movies/#{@lucasfilm_movie1.id}")
      end
    end
  end
end
