require 'rails_helper'

RSpec.describe 'Parties New Page' do
  before :each do
    @current_user = User.create(user_name: "Vicki Vallencourt", email: 'highqualityh2o@ex.com', password: 'pickles')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
    @movie = MoviesFacade.get_movie_details(278)
    @friend1 = User.create(user_name: 'Chris P Bacon', email: 'baconator@example.com', password: 'password123')
    @friend2 = User.create(user_name: 'Anita Nappe', email: 'sleepy1@example.com', password: '123password')
    @current_user.friends.push(@friend1, @friend2)
    visit new_party_path(movie_id: 278)
  end

  describe 'I should see the name of the movie title rendered above a form with the following fields' do

    it 'movie title, duration, when(start date), start time, and a button to create a party' do
      expect(current_path).to eq(new_party_path)
      expect(page).to have_field('length')
      expect(page).to have_field('start_date')
      expect(page).to have_field('start_time')
      expect(page).to have_content(@movie.title)
      expect(page).to have_button('Create Party')

    end

    it 'should also have checkboxes to add friends, if they exist' do
      expect(current_path).to eq(new_party_path)

      expect(page).to have_field('baconator@example.com')
      expect(page).to have_field('sleepy1@example.com')
    end

    it 'can create viewing party' do
      expect(current_path).to eq(new_party_path)



      fill_in 'length', with: @movie.runtime
      fill_in 'start_date', with: Time.now
      fill_in 'start_time', with: Time.now + 30
      check @friend1.email

      click_button 'Create Party'

      expect(current_path).to eq(dashboard_index_path)

      expect(page).to have_content(@movie.title)
      expect(page).to have_content(params[:start_date])
      expect(page).to have_content(params[:start_time])
      expect(page).to have_content(@friend1.email)
    end
  end
end
