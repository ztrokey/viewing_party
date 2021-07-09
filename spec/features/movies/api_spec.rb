require 'rails_helper'

RSpec.describe 'Get movie info from api' do
  before :each do
    @current_user = User.create(user_name: "Vicki Vallencourt", email: 'highqualityh2o@ex.com', password: 'pickles')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)

    visit movies_path
  end

  it 'get top rated movies' do
    expect(page).to have_content('Dilwale Dulhania Le Jayenge')
    expect(page).to have_content(8.7)
  end
end
