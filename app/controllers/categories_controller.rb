class CategoriesController < ApplicationController
  def index; end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    user = current_user
    category.user = user
    if category.save
      redirect_to category, notice: 'Budget category was successfully created.'
    else
      render :new, notice: 'Something went wrong! Budget category was not created'
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
