class Cart < ApplicationRecord

  has_many :cartitems

  def total_price_in_pounds(discount)
    pence_to_pounds(cart_total(discount))
  end

  def cart_total(discount)
    self.cartitems.reduce(0) { |sum, cartitem| sum += cartitem.product.price } - discount
  end

end
