require 'rails_helper'
RSpec.describe 'logging in' do
  before do
    @user = create_user
  end
  it 'prompts for email and password' do
    visit '/sessions/new' #so lets create this route 
    expect(page).to have_field('Email') # lets create an input on this page with an ID of Email
    expect(page).to have_field('Password')
  end
  it 'logs in user if email/password combination is valid' do
    log_in @user
    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).to have_text(@user.name)
  end
  it 'does not sign in user if email/password combination is invalid' do
    log_in @user, 'wrong password'
    expect(page).to have_text('Invalid')
  end
end


# lets do one step at a time 

# visit sessions/new