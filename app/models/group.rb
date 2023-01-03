class Group < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 },
                   uniqueness: { scope: :user, message: 'Category with this name already exist' }
  validates :icon, presence: true

  belongs_to :user
end
