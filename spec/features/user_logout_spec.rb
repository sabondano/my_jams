require 'rails_helper'

feature 'logged in user can logout' do
  scenario 'normal user' do
    user = User.create(username: 'sebastian', password: 'password')
    
    visit login_path
    fill_in 'Username', with: 'sebastian'
    fill_in 'Password', with: 'password'
    click_button 'Login'
    visit root_path
    click_link('logout')

    expect(page).not_to have_content("Welcome, sebastian") 
  end
end
