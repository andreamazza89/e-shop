class AddQuantityToCartitems < ActiveRecord::Migration[5.0]
  def change
    add_column :cartitems, :quantity, :integer, default: 0
  end
end
