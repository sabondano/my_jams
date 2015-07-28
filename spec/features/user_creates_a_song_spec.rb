require 'rails_helper'

feature 'user creates a song' do
  scenario 'with valid params' do
    visit '/songs/new'

    expect(page).to have_content('New Song')
  end
end
