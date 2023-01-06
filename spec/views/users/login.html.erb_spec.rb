require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  before :each do
    @user = User.new(name: 'John Doe', email: 'test@email.com', password: 'password',
                     password_confirmation: 'password').save
    visit user_session_path
  end
  context 'Page Content: ' do
    it 'user can see inputs and button' do
      expect(page).to have_current_path(user_session_path)
    end
    it 'contains button to "LOG IN"' do
      expect(page).to have_button 'LOG IN'
    end
    it 'contains button to "SIGN UP"' do
      expect(page).to have_link 'SIGN UP'
    end
  end
  context 'Page Function' do
    it 'show invalid login' do
      click_button 'LOG IN'
      expect(page).to have_content 'Invalid Email or password.'
    end
    it 'click the login success' do
      fill_in 'user_email', with: 'test@email.com'
      fill_in 'user_password', with: 'password'
      click_button 'LOG IN'
      expect(page).to have_content 'Signed in successfully'
    end
    it 'Login successfully' do
      fill_in 'user_email', with: 'test@email.com'
      fill_in 'user_password', with: 'password'
      click_button 'LOG IN'
      expect(page).to have_current_path(categories_path)
    end
    it 'click "SIGN UP" should redirect to sign-up page' do
      click_link 'SIGN UP'
      expect(page).to have_current_path(new_user_registration_path)
    end
  end
end
