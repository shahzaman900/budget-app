class CategoryPurchase < ApplicationRecord
  # has_many :purchases
  belongs_to :purchase
  belongs_to :category
end