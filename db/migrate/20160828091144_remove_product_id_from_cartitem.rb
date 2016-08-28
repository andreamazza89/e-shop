class RemoveProductIdFromCartitem < ActiveRecord::Migration[5.0]
  def change
    remove_column :cartitems, :product_id, :string
  end
end
