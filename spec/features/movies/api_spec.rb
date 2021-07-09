require 'rails_helper'

RSpec.describe 'test movie search' do
  it 'search' do
    user = User.create(user_name: 'tester', email: 'test@test.com', password: 'password1')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit discover_path

    fill_in :search, with: 'Dark'
    click_button 'Find Movies'

    expect(page).to have_content("Dark")
  end
end
