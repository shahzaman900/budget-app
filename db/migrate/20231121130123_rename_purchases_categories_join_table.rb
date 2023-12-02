class RenamePurchasesCategoriesJoinTable < ActiveRecord::Migration[7.1]
  def change
    rename_table :purchases_categories, :categories_purchases
  end
end
