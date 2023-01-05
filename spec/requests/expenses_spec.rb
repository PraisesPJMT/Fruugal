require 'rails_helper'

RSpec.describe 'Expenses:', type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.new(name: 'John Doe', email: 'test@email.com', password: 'password', password_confirmation: 'password')
    @user.save
    sign_in @user
    @category = Category.new(name: 'Test Category', icon: 'test_icon.url')
    @category.user = @user
    @category.save
    @expense = Expense.new(name: 'Test Expense', amount: 5)
    @expense.user = @user
    @expense.save
  end

  context 'GET new, & /edit' do
    it 'Expense new page success' do
      get new_expense_path
      expect(response).to have_http_status(:success)
    end

    it 'Expense edit page success' do
      get edit_expense_path(@expense)
      expect(response).to have_http_status(:success)
    end
  end
end
