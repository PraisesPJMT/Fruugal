require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @user = User.new(name: 'John Doe', email: 'test@email.com', password: 'password', password_confirmation: 'password')
    @category = Category.new(name: 'Test Category', icon: 'test_icon.url',)
    @category.user = @user
  end

  context 'Validations:' do
    it 'Category is valid with valid attributes' do
      @category.save
      expect(@category).to be_valid
    end

    it 'Category is not valid without a name' do
      @category.name = nil
      @category.save
      expect(@category).to_not be_valid
    end

    it 'Category is not valid without icon' do
      @category.icon = nil
      @category.save
      expect(@category).to_not be_valid
    end
  end

  context 'Details Validations:' do
    it 'Category name should match input' do
      @category.save
      expect(@category.name).to eql 'Test Category'
    end

    it 'Category icon should match input' do
      @category.save
      expect(@category.icon).to eql 'test_icon.url'
    end
  end
end
