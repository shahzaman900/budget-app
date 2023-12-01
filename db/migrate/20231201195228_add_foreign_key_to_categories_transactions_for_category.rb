class AddForeignKeyToCategoriesTransactionsForCategory < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :categories_transactions, :categoriestabels, column: :category_id, primary_key: :id, on_delete: :cascade
    add_foreign_key :categories_transactions, :transactionstabels, column: :transaction_id, primary_key: :id, on_delete: :cascade
  end
end
