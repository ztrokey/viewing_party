require 'rails_helper'

RSpec.describe 'Logging In' do
  before :each do
    visit root_path
  end

  it 'as a registered user, I can log in with the correct information' do
    user = User.create(user_name: 'Bob Barker', email: 'spinthat.wheel@example.com', password: 'sploot')

    click_button 'Log in'

    expect(current_path).to eq('/login')

    fill_in :user_name, with: 'Bob Barker'
    fill_in :email, with: 'spinthat.wheel@example.com'
    fill_in :password, with: 'sploot'

    click_button 'Log in'

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content("Welcome, Bob Barker!")
    expect(page).to_not have_link('Register')
    expect(page).to_not have_link('Log in')
  end

  it 'as a registered user, I can not log in with the incorrect information' do
    user = User.create(user_name: 'Bob Barker', email: 'spinthat.wheel@example.com', password: 'sploot')

    click_button 'Log in'

    expect(current_path).to eq('/login')

    fill_in :user_name, with: 'Bob Barker'
    fill_in :email, with: 'spinthat.wheel@example.com'
    fill_in :password, with: 'showmethemoney'

    click_button 'Log in'

    expect(current_path).to eq('/login')
    expect(page).to have_content('Your email or password are incorrect')
  end
end
