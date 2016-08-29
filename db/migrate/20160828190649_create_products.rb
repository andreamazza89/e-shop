class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.integer :stock_quantity

      t.timestamps
    end
  end
end
