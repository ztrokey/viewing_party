require 'rails_helper'

RSpec.describe 'dashboard index page' do
  it 'requires a user to be logged in' do
    visit dashboard_index_path

    expect(current_path).to eq(root_path)

    visit root_path

    user1 = User.create(user_name: 'Bob Barker', email: 'spinthat.wheel@example.com', password: 'sploot')
    user2 = User.create(user_name: 'Chris P Bacon', email: 'baconator@example.com', password: 'password123')
    user3 = User.create(user_name: 'Anita Nappe', email: 'sleepy1@example.com', password: '123password')

    user1.friends << user2
    user1.friends << user3

    click_button 'Log in'

    expect(current_path).to eq('/login')

    fill_in :user_name, with: 'Bob Barker'
    fill_in :email, with: 'spinthat.wheel@example.com'
    fill_in :password, with: 'sploot'

    click_button 'Log in'

    visit dashboard_index_path

    expect(page).to have_content("Welcome #{user1.user_name}!")

    expect(page).to have_selector(:link_or_button, 'Discover Movies')

    within('#friends') do
      expect(page).to have_content(user2.user_name)
      expect(page).to have_content(user3.user_name)
    end

    expect(page).to have_content("Your Viewing Parties")
  end
end
