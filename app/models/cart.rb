class Cart < ApplicationRecord

  has_many :cartitems
  has_and_belongs_to_many :vouchers
  accepts_nested_attributes_for :vouchers

  def total_price_in_pounds(discounts)
    pence_to_pounds(cart_total - discounts.to_i)
  end

  def cart_total
   self.cartitems.reduce(0) { |sum, cartitem| sum += cartitem.product.price }
  end

  private
  
  def pence_to_pounds(total)
    return '0.00' if total == 0
    total.to_s[0..-3] + '.' + total.to_s[-2..-1]
  end

end
