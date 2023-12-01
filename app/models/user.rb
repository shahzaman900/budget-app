class User < ApplicationRecord
  has_many :categoriestabels
  has_many :transactionstabels, foreign_key: 'author_id'

  def total_budget
    transactionstabels.sum(:amount)
  end
end
