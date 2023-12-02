class CreatePurchases < ActiveRecord::Migration[7.1]
  def change
    create_table :purchases do |t|
      t.string :name
      t.float :amount
      t.references :author, foreign_key: { to_table: :users }
      t.references :categories, foreign_key: true
      t.timestamps
    end
  end
end
