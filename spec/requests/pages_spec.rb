require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.new(name: 'John Doe', email: 'test@email.com', password: 'password', password_confirmation: 'password')
  end

  describe 'GET /splash' do
    it 'returns http success' do
      get '/pages/splash'
      expect(response).to have_http_status(:success)
    end

    it 'returns http success' do
      get '/pages/splash'
      expect(response.body).to include('Fruugal')
    end
  end
end
