class Expense < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true,
                     numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  has_many :expense_categories, foreign_key: 'expense_id',
                                dependent: :destroy
  has_many :categories, through: :expense_categories, dependent: :destroy
end
