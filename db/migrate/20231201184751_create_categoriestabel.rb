class CreateCategoriestabel < ActiveRecord::Migration[7.1]
  def change
    create_table :categoriestabels do |t|
      t.string :name
      t.string :icon
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
