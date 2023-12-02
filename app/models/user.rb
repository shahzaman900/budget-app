class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :categories
  has_many :purchases, foreign_key: 'author_id'

  validates :name, presence: true, length: { maximum: 100 }

  def total_budget
    purchases.sum(:amount)
  end
end
