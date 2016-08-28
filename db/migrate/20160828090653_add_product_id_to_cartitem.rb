class AddProductIdToCartitem < ActiveRecord::Migration[5.0]
  def change
    add_column :cartitems, :product_id, :integer
  end
end
