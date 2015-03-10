require 'rails_helper'

feature 'User Management' do
  scenario 'create a new user' do
    visit root_path
    fill_in 'user_username', with: 'babel_user'
    choose('yoda')
    click_button 'Login'
    expect(current_path).to eq messages_path
  end

  scenario 'it does not create a new user with invalid data' do
    visit root_path
    fill_in 'user_username', with: ''
    choose('yoda')
    click_button 'Login'
    expect(page).to have_content('Please Enter a name Username')
  end

  scenario 'it set the user language type on messages path' do
    visit root_path
    fill_in 'user_username', with: 'bender'
    choose('type_binary')
    click_button 'Login'
    expect(page).to have_content('binary')
  end
end