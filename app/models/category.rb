class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 },
                   uniqueness: { scope: :user, message: 'Category with this name already exist' }
  validates :icon, presence: true

  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  ICONS = %i[accounting bank books classroom dumbbell diet education family fish piggy-bank religion spiritual sports
             tax user vegetable].freeze
end
