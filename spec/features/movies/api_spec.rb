require 'rails_helper'

RSpec.describe 'test movie search' do
  before :each do
    user = User.create(user_name: 'tester', email: 'test@test.com', password: 'password1')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  it 'search', :vcr do
    response_body = File.open('spec/fixtures/vcr_cassettes/test_movie_search/search.yml')
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=1b17b459898cab4bf91604ffd3524db3&query=dark").
         to_return(status: 200, body: response_body)
    visit discover_path

    fill_in :search, with: 'Dark'
    click_button 'Find Movies'
  save_and_open_page
    expect(page).to have_content("Dark")
  end
end
