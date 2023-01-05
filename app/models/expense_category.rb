class ExpenseCategory < ApplicationRecord
  belongs_to :category
  belongs_to :expense
end
