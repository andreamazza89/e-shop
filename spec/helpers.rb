module Helpers
  def add_product_to_cart(product, cart)
    cart_item = Cartitem.new 
    cart_item.product = product
    cart_item.cart = cart
    cart_item.save
  end
end
