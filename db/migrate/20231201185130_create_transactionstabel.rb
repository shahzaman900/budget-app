class CreateTransactionstabel < ActiveRecord::Migration[7.1]
  def change
    create_table :transactionstabels do |t|
      t.string :name
      t.float :amount
      t.references :author, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
