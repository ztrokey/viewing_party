require 'rails_helper'

RSpec.describe 'Movies Index Page' do
  before :each do
    @current_user = User.create(user_name: "Vicki Vallencourt", email: 'highqualityh2o@ex.com', password: 'pickles')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
  end

  it 'display top rated movies' do
    VCR.use_cassette('returns top rated movie data correctly') do
      visit discover_path

      click_button "Find Top Rated Movies"

      expect(current_path).to eq(movies_path)
      expect(page.status_code).to eq(200)

      within('.top-rated-movies') do
        expect(page.all('ol', count: 40))
      end
      expect(page).to have_link('Dilwale Dulhania Le Jayenge')
      expect(page).to have_content(8.7)
      expect(page).to_not have_button('Find Top Rated Movies')
    end
  end

  it 'search results' do
    VCR.use_cassette('returns movie searched') do
      visit discover_path

      fill_in :search, with: 'Dark'
      click_button 'Find Movies'

      expect(current_path).to eq(movies_path)
      expect(page.status_code).to eq(200)
      within('.search_results') do
        expect(page.all('ul', count: 40))
      end
      expect(page).to have_link('Dark Phoenix')
      expect(page).to have_content('6.1')
      expect(page).to have_button('Find Top Rated Movies')
    end
  end
end
