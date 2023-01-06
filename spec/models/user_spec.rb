require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'John Doe', email: 'test@email.com', password: 'password', password_confirmation: 'password')
  end

  context 'Validations:' do
    it 'User is valid with valid attributes' do
      @user.save
      expect(@user).to be_valid
    end

    it 'User is not valid without a name' do
      @user.name = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it 'User is not valid without email' do
      @user.email = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it 'User is not valid without password' do
      @user.password = nil
      @user.save
      expect(@user).to_not be_valid
    end
  end

  context 'Details Validations:' do
    it 'User name should match input' do
      @user.save
      expect(@user.name).to eql 'John Doe'
    end

    it 'User email should match input' do
      @user.save
      expect(@user.email).to eql 'test@email.com'
    end

    it 'User password should match input' do
      @user.save
      expect(@user.password).to eql 'password'
    end
  end
end
