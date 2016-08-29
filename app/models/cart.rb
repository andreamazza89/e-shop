class Cart < ApplicationRecord

  has_many :cartitems

  def total_price_in_pounds
    total_in_pence = self.cartitems.reduce(0) { |sum, cartitem| sum += cartitem.product.price }
    pence_to_pounds(total_in_pence)
  end

  private
  
  def pence_to_pounds(total)
    return '0.00' if total == 0
    total.to_s[0..-3] + '.' + total.to_s[-2..-1]
  end

end
