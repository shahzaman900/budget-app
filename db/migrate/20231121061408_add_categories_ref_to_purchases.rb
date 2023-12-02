class AddCategoriesRefToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_reference :purchases, :categories, foreign_key: true
  end
end
