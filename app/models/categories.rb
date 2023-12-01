class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :transactionstabels

  def transactions_sum
    transactionstabels.sum(:amount)
  end
end
