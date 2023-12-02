class CreatePurchasesCategoriesJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :purchases_categories, id: false do |t|
      t.bigint :purchase_id, null: false
      t.bigint :category_id, null: false
    end

    add_index :purchases_categories, [:purchase_id, :category_id], unique: true
  end
end
