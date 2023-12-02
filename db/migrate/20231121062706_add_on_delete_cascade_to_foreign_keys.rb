class AddOnDeleteCascadeToForeignKeys < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :categories, column: "purchases_id"
    remove_foreign_key :categories, :users
    remove_foreign_key :purchases, column: "categories_id"
    remove_foreign_key :purchases, column: "author_id"

    add_foreign_key :categories, :purchases, column: "purchases_id", on_delete: :cascade
    add_foreign_key :categories, :users, on_delete: :cascade
    add_foreign_key :purchases, :categories, column: "categories_id", on_delete: :cascade
    add_foreign_key :purchases, :users, column: "author_id", on_delete: :cascade
  end
end
