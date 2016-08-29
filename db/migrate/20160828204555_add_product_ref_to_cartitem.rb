class AddProductRefToCartitem < ActiveRecord::Migration[5.0]
  def change
    add_reference :cartitems, :product, foreign_key: true
  end
end
