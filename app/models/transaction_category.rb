class TransactionCategory < ApplicationRecord
  belongs_to :category, class_name: 'Category'
  belongs_to :transaction, class_name: 'Transaction'
end
