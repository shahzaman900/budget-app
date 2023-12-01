class CreateTransactionsCategoriestable < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions_categoriestables do |t|

      t.timestamps
    end
  end
end
