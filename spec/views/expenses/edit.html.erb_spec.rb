require 'rails_helper'

RSpec.feature 'Expense/edit.html.erb', type: :feature do
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
    @expense = Expense.new(name: 'Test Expense', amount: 5)
    @expense.user = @user
    @expense.save
    visit edit_expense_path(@expense)
  end

  context 'Page Contents: ' do
    it 'can view Expense creation page' do
      expect(page).to have_current_path(edit_expense_path(@expense))
    end

    it 'contains Expense details "name"' do
      expect(page).to have_css("input[type*='text']")
    end

    it 'contains Expense details "name"' do
      expect(page).to have_css("input[value*='Test Expense']")
    end

    it 'contains Expense details "name"' do
      expect(page).to have_css("input[type*='number']")
    end

    it 'contains Expense details "name"' do
      expect(page).to have_css("input[value*='5']")
    end

    it 'contains link to "BACK TO CATEGORY"' do
      expect(page).to have_link 'BACK TO CATEGORY'
    end

    it 'contains button to "UPDATE TRANSACTION"' do
      expect(page).to have_button 'UPDATE TRANSACTION'
    end
  end

  context 'Page Function:' do
    it 'click link to "BACK TO CATEGORY"' do
      visit categories_path
      visit edit_expense_path(@expense)
      click_link 'BACK TO CATEGORY'
      expect(page).to have_current_path(edit_expense_path(@expense))
    end
  end
end
