class AddPurchasesCategoriesRefToCategoriesAndPurchases < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :purchases_categories, :purchases, column: :purchase_id, on_delete: :cascade
    add_foreign_key :purchases_categories, :categories, column: :category_id, on_delete: :cascade
  end
end
