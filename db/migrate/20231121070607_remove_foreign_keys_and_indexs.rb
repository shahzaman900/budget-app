class RemoveForeignKeysAndIndexs < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :categories, column: :purchases_id
    remove_index :categories, column: :purchases_id

    remove_foreign_key :purchases, column: :categories_id
    remove_index :purchases, column: :categories_id
  end
end
