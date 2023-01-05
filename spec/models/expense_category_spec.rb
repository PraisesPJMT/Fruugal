require 'rails_helper'

RSpec.describe ExpenseCategory, type: :model do
  before :each do
    @user = User.new(name: 'John Doe', email: 'test@email.com', password: 'password', password_confirmation: 'password')
    @category = Category.new(name: 'Test Category', icon: 'test_icon.url')
    @category.user = @user
    @category.save
    @expense = Expense.new(name: 'Test Expense', amount: 5)
    @expense.user = @user
    @expense.save
    @expense_category = ExpenseCategory.create(category_id: @category.id, expense_id: @expense.id)
  end

  context 'Validations:' do
    it 'ExpenseCategory is valid with valid attributes' do
      @expense_category.save
      expect(@expense_category).to be_valid
    end

    it 'ExpenseCategory is not valid without a category_id' do
      @expense_category.category_id = nil
      @expense_category.save
      expect(@expense_category).to_not be_valid
    end

    it 'ExpenseCategory is not valid without expense_id' do
      @expense_category.expense_id = nil
      @expense_category.save
      expect(@expense_category).to_not be_valid
    end
  end

  context 'Details Validations:' do
    it 'ExpenseCategory category_id should match input' do
      @expense_category.save
      expect(@expense_category.category_id).to eql @category.id
    end

    it 'ExpenseCategory amount should match expense_id' do
      @expense_category.save
      expect(@expense_category.expense_id).to eql @expense.id
    end
  end
end
