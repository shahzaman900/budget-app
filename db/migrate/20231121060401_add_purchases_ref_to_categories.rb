class AddPurchasesRefToCategories < ActiveRecord::Migration[7.1]
  def change
    add_reference :categories, :purchases, null: false, foreign_key: true
  end
end
