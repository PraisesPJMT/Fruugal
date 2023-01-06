require 'rails_helper'

RSpec.feature 'New Category Page:', type: :feature do
  before :each do
    @user = User.new(name: 'John Doe', email: 'test@email.com', password: 'password', password_confirmation: 'password')
    @user.save
    visit user_session_path
    fill_in 'user_email', with: 'test@email.com'
    fill_in 'user_password', with: 'password'
    click_button 'LOG IN'
    visit categories_path
    visit new_category_path
  end

  context 'Page Contents: ' do
    it 'can view Category creation page' do
      expect(page).to have_current_path(new_category_path)
    end

    it 'contains Category details "name"' do
      expect(page).to have_css("input[type*='text']")
    end

    it 'contains Category details "name"' do
      expect(page).to have_css("input[type*='radio']")
    end

    it 'contains link to "BACK TO CATEGORY"' do
      expect(page).to have_link 'BACK TO CATEGORY'
    end

    it 'contains button to "CREATE CATEGORY"' do
      expect(page).to have_button 'CREATE CATEGORY'
    end
  end

  context 'Page Function:' do
    it 'click link to "BACK TO CATEGORY"' do
      visit categories_path
      visit new_category_path
      click_link 'BACK TO CATEGORY'
      expect(page).to have_current_path(new_category_path)
    end

    it 'click link to create category "CREATE CATEGORY"' do
      click_button 'CREATE CATEGORY'
      expect(page).to have_current_path(categories_path)
    end
  end
end
