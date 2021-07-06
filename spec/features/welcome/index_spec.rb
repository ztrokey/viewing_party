require 'rails_helper'

RSpec.describe 'Welcome Page' do
  before :each do
    visit root_path
  end

  it 'have a Welcome message and Brief description of the application' do
    expect(current_path).to eq(root_path)

    expect(page).to have_content('Welcome to Viewing Party')
    expect(page).to have_content("Viewing party is an application in which users can explore movie options and create a viewing party event for the user and friend's.")
  end

  it 'has a log in button and link to Registration' do
    expect(current_path).to eq(root_path)

    expect(page).to have_link('Register', href: new_user_path )
    expect(page).to have_button('Log in')
  end
end
