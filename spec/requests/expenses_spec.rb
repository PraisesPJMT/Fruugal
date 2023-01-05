require 'rails_helper'

RSpec.describe 'Expenses:', type: :request do
  describe 'GET /create' do
    it 'returns http success' do
      get '/transactions/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/transactions/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/transactions/destroy'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/transactions/new'
      expect(response).to have_http_status(:success)
    end
  end
end
