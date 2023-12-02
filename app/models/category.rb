class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :purchases

  validates :name, presence: true, length: { maximum: 100 }, uniqueness: { scope: :user, message: 'Category exists!' }
  validates :icon, presence: true

  def purchases_sum
    purchases.sum(:amount)
  end
end
