require 'rails_helper'

RSpec.feature 'User Profile:', type: :feature do
  before :each do
    @user = User.new(name: 'John Doe', email: 'test@email.com', password: 'password', password_confirmation: 'password')
    @user.save
    visit user_session_path
    fill_in 'user_email', with: 'test@email.com'
    fill_in 'user_password', with: 'password'
    click_button 'LOG IN'
    visit user_path(@user)
  end

  context 'Page Contents: ' do
    it 'can view user profile' do
      expect(page).to have_current_path(user_path(@user))
    end

    it 'contains user details' do
      expect(page).to have_content @user.name
      expect(page).to have_content @user.email
      expect(page).to have_content @user.sign_in_count
      expect(page).to have_content @user.current_sign_in_at
      expect(page).to have_content @user.last_sign_in_at
    end

    it 'contains button to "LOG OUT"' do
      expect(page).to have_button 'LOG OUT'
    end

    it 'contains link to "EDIT PROFILE"' do
      expect(page).to have_link 'EDIT PROFILE'
    end

    it 'contains button to "VIEW BUDGETS"' do
      expect(page).to have_button 'VIEW BUDGETS'
    end
  end

  context 'Page Fuction:' do
    it 'click link to edit profile' do
      click_link 'EDIT PROFILE'
      expect(page).to have_current_path(edit_user_registration_path(@user))
    end

    it 'click button to "LOG OUT"' do
      click_button 'LOG OUT'
      expect(page).to have_current_path(new_user_session_path)
    end
  end

  # it 'click the login error' do
  #   click_button 'LOG IN'
  #   expect(page).to have_content 'Invalid Email or password.'
  # end
  #
  # it 'click the login success' do
  #   fill_in 'user_email', with: 'test@email.com'
  #   fill_in 'user_password', with: 'password'
  #   click_button 'LOG IN'
  #   expect(page).to have_content 'Signed in successfully'
  # end
  #
  # it 'Login successfully' do
  #   fill_in 'user_email', with: 'test@email.com'
  #   fill_in 'user_password', with: 'password'
  #   click_button 'LOG IN'
  #   expect(page).to have_current_path(user_path(@user))
  # end
end
