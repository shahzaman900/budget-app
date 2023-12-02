class CreateCatePurchaseTbale < ActiveRecord::Migration[7.1]
  def change
    create_table :category_purchase do |t|
      t.references :category, foreign_key: { to_table: :categories }
      t.references :purchase, foreign_key: { to_table: :purchases }
      t.timestamps
    end
  end
end
