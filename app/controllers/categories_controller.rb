class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.order(created_at: :desc)
    @total = calculate_total
  end

  def show
    @category = Category.find(params[:id])
    @expenses = ExpenseCategory.all.where(category_id: @category.id).includes(:expense).order(created_at: :desc)
    @total_expenses = obtain_total
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

  def obtain_total
    sum = 0
    @expenses.each do |exp|
      sum += exp.expense.amount.to_i
    end
    sum
  end

  def calculate_total
    sum = 0
    exp = ExpenseCategory.all
    exp.each do |cat|
      sum += cat.expense.amount.to_i
    end
    sum
  end
end
