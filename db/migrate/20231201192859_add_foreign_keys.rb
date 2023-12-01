class AddForeignKeys < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :categories_transactions, :categoriestabels, on_delete: :cascade
    add_foreign_key :categories_transactions, :transactionstabels, on_delete: :cascade

  end
end
