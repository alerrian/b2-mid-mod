require 'rails_helper'

RSpec.describe 'as a user', type: :feature do
  describe 'when I visit the index' do
    before :each do
      @studio1 = Studio.create!(
        name: 'Fox'
      )
      @studio2 = Studio.create!(
        name: 'Disney'
      )
      @studio3 = Studio.create!(
        name: 'Lucasfilm'
      )
    end

    it 'can see all of the movie studios' do
      visit '/studios'

      expect(page).to have_content('Fox')
      expect(page).to have_content('Disney')
      expect(page).to have_content('Lucasfilm')
    end
  end
end
