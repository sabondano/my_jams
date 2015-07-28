require 'rails_helper'

feature 'registered user can login' do
  scenario 'with valid params' do
    user = User.create(username: 'sebastian', password: 'password')

    visit login_path
    fill_in 'Username', with: 'sebastian'
    fill_in 'Password', with: 'password'
    click_button 'Login'

    expect(page).to have_content('Welcome, sebastian')
  end
end
