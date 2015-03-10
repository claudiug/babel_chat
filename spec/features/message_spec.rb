require 'rails_helper'

feature 'Messages' do
  scenario 'login user I must send chat messages' do
    visit root_path
    fill_in 'user_username', with: 'babel_user'
    choose('yoda')
    click_button 'Login'
    fill_in 'message', with: 'amazing text'
    click_button 'send'
    expect(page).to have_content 'Amazing text'
  end

  scenario 'I should not be able to send empty messages' do
    visit root_path
    fill_in 'user_username', with: 'babel_user'
    choose('yoda')
    click_button 'Login'
    fill_in 'message', with: ''
    click_button 'send'
    expect(page).to_not have_css("alert alert-success")
  end
end