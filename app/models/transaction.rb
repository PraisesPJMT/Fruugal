class Transaction < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true,
                     numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  has_many :transaction_categories, class_name: 'TransactionCategory', foreign_key: 'transaction_id',
                                    dependent: :destroy
  has_many :categories, through: :transaction_categories, dependent: :destroy
end
