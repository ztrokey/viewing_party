require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit register_path

    username = 'chris_p_bacon@gmail.com'
    password = 'test123'

    fill_in 'user[email]', with: username
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password


    click_on 'Register'
    expect(page).to have_content("Welcome #{username}!")
    expect(current_path).to eq(dashboard_index_path)
  end
end
