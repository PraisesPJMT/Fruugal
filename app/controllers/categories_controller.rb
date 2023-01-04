class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
  end

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

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      redirect_to category, notice: 'Budget category was successfully updated.'
    else
      flash[:notice] = 'Something went wrong! Budget category was not updated'
    end
  end

  def destroy
    category = Category.find(params[:id])
    if category.destroy
      redirect_to categories_url, notice: 'Budget category was successfully destroyed.'
    else
      render category, notice: 'Something went wrong! Budget category was not destroyed'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
