require 'rails_helper'

RSpec.describe 'Users Request:', type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.new(name: 'John Doe', email: 'test@email.com', password: 'password', password_confirmation: 'password')
    @user.save
    sign_in @user
  end

  context 'GET /show & /edit ' do
    it 'User profile page success' do
      get user_path(@user)
      expect(response).to have_http_status(:success)
    end

    it 'User edit page success' do
      get edit_user_registration_path(@user)
      expect(response).to have_http_status(:success)
    end
  end
end
