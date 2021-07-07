require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit register_path

    username = 'Big Bacon Boie'
    email = 'chris_p_bacon@gmail.com'
    password = 'test123'

    fill_in 'user[user_name]', with: username
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password


    click_on 'Register'

    expect(page).to have_content("Welcome #{username}!")

    expect(current_path).to eq(dashboard_index_path)
    new_user = User.last
    expect(new_user.email).to eq('chris_p_bacon@gmail.com')
  end
end
