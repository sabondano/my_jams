require 'rails_helper'

feature 'user creates account' do
  scenario 'with valid params' do
    visit new_user_path
    fill_in 'Username', with: 'sebastian'
    fill_in 'Password', with: 'password'
    click_button 'Create Account'
    
    expect(page).to have_content("Welcome, sebastian")
  end
end
