class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 },
                   uniqueness: { scope: :user, message: 'Category with this name already exist' }
  validates :icon, presence: true

  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  has_many :transaction_categories, class_name: 'TransactionCategory', foreign_key: 'category_id', dependent: :destroy
  has_many :transactions, through: :transaction_categories, dependent: :destroy

  ICONS = %i[accounting bank books classroom dumbbell diet education family fish piggy-bank religion spiritual sports
             tax user vegetable].freeze
end
