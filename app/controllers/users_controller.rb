class UsersController < ApplicationController
  def show
    @user = current_user
    @total_categories = current_user.categories.size
    @total_expenses = calculate_total
  end

  private

  def calculate_total
    sum = 0
    current_user.categories.each do |cat|
      sum += ExpenseCategory.all.where(category_id: cat.id).size
    end
    sum
  end
end
