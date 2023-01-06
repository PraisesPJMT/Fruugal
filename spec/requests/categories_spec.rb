require 'rails_helper'

RSpec.describe 'Categories:', type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.new(name: 'John Doe', email: 'test@email.com', password: 'password', password_confirmation: 'password')
    @user.save
    sign_in @user
    @category = Category.new(name: 'Test Category', icon: 'test_icon.url')
    @category.user = @user
    @category.save
  end

  context 'GET /index, /new, /edit, & /show ' do
    it 'Categories page success' do
      get categories_path
      expect(response).to have_http_status(:success)
    end

    it 'Category page success' do
      get category_path(@category)
      expect(response).to have_http_status(:success)
    end

    it 'Category new page success' do
      get new_category_path
      expect(response).to have_http_status(:success)
    end

    it 'Category edit page success' do
      get edit_category_path(@category)
      expect(response).to have_http_status(:success)
    end
  end

  context 'Post /create ' do
    let(:valid_params) do
      {
        category: {
          name: 'Valid category',
          icon: 'valid_icon'
        },
        author: @user
      }
    end

    it 'Category creation success' do
      expect { post categories_path, params: valid_params }.to change(Category, :count).by(+1)
      expect(response).to have_http_status :found
    end

    it 'Creates category with the correct attributes' do
      post categories_path, params: valid_params
      expect(Category.last).to have_attributes valid_params[:category]
    end
  end

  context 'PUT /update ' do
    let(:valid_params) do
      {
        category: {
          name: 'Updated valid category',
          icon: 'updated_valid_icon'
        },
        author: @user
      }
    end

    it 'Category update success' do
      expect { put category_path(@category), params: valid_params }.to change(Category, :count).by(0)
      expect(response).to have_http_status :found
    end

    it 'Updates category with the correct attributes' do
      put category_path(@category), params: valid_params
      expect(Category.last).to have_attributes valid_params[:category]
    end
  end

  context 'DELETE /destroy ' do
    it 'Category destroy success' do
      expect { delete category_path(@category) }.to change(Category, :count).by(-1)
      expect(response).to have_http_status :found
    end
  end
end
