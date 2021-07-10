require 'rails_helper'

RSpec.describe 'Movies Index Page' do
  before :each do
    @current_user = User.create(user_name: "Vicki Vallencourt", email: 'highqualityh2o@ex.com', password: 'pickles')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
  end

  it 'display top rated movies', :vcr do
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
