class RemoveColumnsFromCategoriesAndPurchases < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :purchases_id
    remove_column :purchases, :categories_id
  end
end
