class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @categories = current_user.categories
    @expense_categories = @expense.expense_categories.build
  end

  def create
    expense = Expense.new(expense_params.except(:expense_categories))
    expense.author_id = current_user.id

    if expense.save
      category = expense_params[:expense_categories][:category_ids][1]
      expense_params[:expense_categories][:category_ids].each do |id|
        expense.expense_categories.create(category_id: id) unless id == ''
      end
      redirect_to category_path(category), notice: 'Budget was successfully created.'
    else
      render expense, alert: 'Something went wrong! Budget expense was not created.'
    end
  end

  def edit
    @expense = Expense.find(params[:id])
    @categories = current_user.categories
    @expense_categories = @expense.expense_categories.build
  end

  def update
    expense = Expense.find(params[:id])
    if expense.update(expense_params.except(:expense_categories))
      category = expense_params[:expense_categories][:category_ids][1]
      redirect_to category_path(category), notice: 'Budget expense successfully updated.'
    else
      flash[:alert] = 'Something went wrong! Budget expense was not updated'
      redirect_to edit_expense_path(expense)
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expo = ExpenseCategory.all.where(expense_id: @expense.id)[0]
    @category = @expo.category
    @expense.destroy
    redirect_to category_path(@category), notice: 'Expense successfully deleted.'
  end

  private

  def expense_params
    params.require(:new_expense).permit(:name, :amount, expense_categories: [category_ids: []])
  end
end
