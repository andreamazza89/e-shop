class Cart < ApplicationRecord

  has_many :cartitems
  has_many :products, through: :cartitems

  def total_price_in_pounds(discount)
    pence_to_pounds(cart_total(discount))
  end

  def cart_total(discount)
    self.cartitems.reduce(0) { |sum, cartitem| sum += cartitem.product.price } - discount
  end

  def already_has_product?(product)
    products.any? { |item| item == product }
  end

end
