require 'rails_helper'

RSpec.describe 'dashboard index page' do
  it 'redirects to the root_path if a user is not logged in' do
    user1 = User.create(user_name: 'Bob Barker', email: 'spinthat.wheel@example.com', password: 'sploot')

    visit dashboard_index_path

    expect(current_path).to eq(root_path)
  end
  it 'allows a logged in user to visit the dashboard page' do
    visit root_path

    user1 = User.create(user_name: 'Bob Barker', email: 'spinthat.wheel@example.com', password: 'sploot')
    user2 = User.create(user_name: 'Chris P Bacon', email: 'baconator@example.com', password: 'password123')
    user3 = User.create(user_name: 'Anita Nappe', email: 'sleepy1@example.com', password: '123password')

    user1.friends << user2
    user1.friends << user3

    click_on 'Log in'

    expect(current_path).to eq('/login')

    fill_in :user_name, with: 'Bob Barker'
    fill_in :email, with: 'spinthat.wheel@example.com'
    fill_in :password, with: 'sploot'

    click_on 'Log in'

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content("Welcome #{user1.user_name}!")
    expect(page).to have_selector(:link_or_button, 'Discover Movies')
    within('#friends') do
      expect(page).to have_content(user2.user_name)
      expect(page).to have_content(user3.user_name)
    end
    expect(page).to have_content("Your Viewing Parties")
  end
  it 'has a section to add friends' do
    user1 = User.create(user_name: 'test1', email: 'test1@example.com', password: 'sploot')
    user2 = User.create(user_name: 'test2', email: 'test2@example.com', password: 'password123')
    user3 = User.create(user_name: 'test3', email: 'test3@example.com', password: '123password')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit dashboard_index_path

    within('#friends') do
      expect(page).to have_content('You currently have no friends')
      expect(page).to have_button('Add Friend')
    end
  end
  it 'can add a friend if their email exists' do
    user1 = User.create(user_name: 'test1', email: 'test1@example.com', password: 'sploot')
    user2 = User.create(user_name: 'test2', email: 'test2@example.com', password: 'password123')
    user3 = User.create(user_name: 'test3', email: 'test3@example.com', password: '123password')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit dashboard_index_path

    within('#friends') do
      fill_in "friends",	with: "#{user2.email}"
      click_button 'Add Friend'

      fill_in "friends",	with: "#{user3.email}"
      click_button 'Add Friend'

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content("#{user2.user_name}")
      expect(page).to have_content("#{user3.user_name}")
    end
    within('#friends') do
      fill_in "friends",	with: 'idontexist@example.com'
      click_button 'Add Friend'
    end
    expect(page).to have_content('Please enter a vaild email address')
  end

  it 'user can log out' do
    user1 = User.create(user_name: 'Bob Barker', email: 'spinthat.wheel@example.com', password: 'sploot')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    visit root_path

    click_on 'Log in'

    visit dashboard_index_path

    expect(page).to have_link('Log out', href: '/logout')

    click_on 'Log out'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Logged out')
  end
end
