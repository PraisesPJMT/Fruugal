require 'rails_helper'

RSpec.feature 'Splash Screen:', type: :feature do
  before :each do
    visit root_path
  end

  context 'Page Contents:' do
    it 'contains app logo "Fruugal"' do
      expect(page).to have_content 'Fruugal'
    end

    it 'contains link to "LOG IN"' do
      expect(page).to have_link 'LOG IN'
    end

    it 'contains link to "SIGN UP"' do
      expect(page).to have_link 'SIGN UP'
    end
  end

  context 'Page Function:' do
    it 'click "LOG IN" should redirect to sign-in page' do
      click_link 'LOG IN'
      expect(page).to have_current_path(new_user_session_path)
    end

    it 'click "SIGN UP" should redirect to sign-up page' do
      click_link 'SIGN UP'
      expect(page).to have_current_path(new_user_registration_path)
    end
  end
end
