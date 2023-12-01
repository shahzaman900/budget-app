class RemoveForeignKeyFromCategoriestabels < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :categoriestabels, column: :user_id
    remove_foreign_key :transactionstabels, column: :author_id

    add_foreign_key :categoriestabels, :users, column: :user_id, primary_key: :id, on_delete: :cascade
    add_foreign_key :transactionstabels, :users, column: :author_id, primary_key: :id, on_delete: :cascade
  end
end
