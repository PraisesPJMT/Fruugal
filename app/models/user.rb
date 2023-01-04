class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true

  has_many :categories, class_name: 'Category', foreign_key: 'author_id', dependent: :destroy
  has_many :transactions, class_name: 'Transaction', foreign_key: 'author_id', dependent: :destroy
end
