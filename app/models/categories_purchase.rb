class Categoriespurchase < ApplicationRecord
  belongs_to :category
  belongs_to :purchase
end
