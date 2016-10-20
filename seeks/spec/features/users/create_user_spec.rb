
require 'rails_helper'
RSpec.describe 'creating a user' do
  before do
    visit '/users/new'
  end
  it 'creates new user and redirects to profile page with proper credentials' do
    fill_in 'Email', with: 'kobe@lakers.com'
    fill_in 'Name', with: 'kobe'
    fill_in 'Password', with:  'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Join'
    last_user = User.last
    expect(current_path).to eq("/sessions/new")
    # no but I like tis
  end
  # So it says that last_user is nil, so that means taht we were not able to create a user
  # when we clicked the register user
  it 'shows validation errors without proper credentials' do
    click_button 'Join'
    expect(current_path).to eq('/users/new')
    expect(page).to have_text("can't be blank")
    expect(page).to have_text("invalid")
  end
end