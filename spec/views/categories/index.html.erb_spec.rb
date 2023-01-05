require 'rails_helper'

RSpec.feature 'Categories Index Page:', type: :feature do
  before :each do
    @user = User.new(name: 'John Doe', email: 'test@email.com', password: 'password', password_confirmation: 'password')
    @user.save
    visit user_session_path
    fill_in 'user_email', with: 'test@email.com'
    fill_in 'user_password', with: 'password'
    click_button 'LOG IN'
    @category = Category.new(name: 'Test Category', icon: 'test_icon.url')
    @category.user = @user
    @category.save
    visit categories_path
  end

  context 'Page Contents: ' do
    it 'can view Category' do
      expect(page).to have_current_path(categories_path)
    end

    it 'contains Category details "name"' do
      expect(page).to have_content @category.name
    end

    it 'contains Category details "creation date"' do
      expect(page).to have_content @category.created_at.strftime(' %Y at %I:%M %p')
    end

    it 'contains category icon image' do
      expect(page).to have_css("img[src*='test_icon.url']")
    end

    it 'contains link to "NEW CATEGORY"' do
      expect(page).to have_link 'NEW CATEGORY'
    end
  end

  context 'Page Function:' do
    it 'click link to create category' do
      click_link 'NEW CATEGORY'
      expect(page).to have_current_path(new_category_path)
    end

    it 'click category link' do
      click_link 'Test Category'
      expect(page).to have_current_path(category_path(@category))
    end
  end
end
