require 'rails_helper'

RSpec.describe 'as a user', type: :feature do
  describe 'when I visit the index' do
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
    end

    it 'can see all of the movie studios' do
      visit '/studios'

      expect(page).to have_content('Disney')
      expect(page).to have_content('Lucasfilm')
    end

    it 'can see a list of movies under each studio' do
      visit '/studios'

      within "#studio_#{@disney.id}" do
        expect(page).to have_content('Snow White')
        expect(page).to have_content('The Force Awakens')
      end

      within "#studio_#{@lucasfilm.id}" do
        expect(page).to have_content('The Phantom Menace')
        expect(page).to have_content('A New Hope')
      end
    end
  end
end
