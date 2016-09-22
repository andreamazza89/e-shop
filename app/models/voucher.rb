class Voucher
  
  def self.validate_voucher(code, cart_id, discount)
    case code
      when 'FIVE OFF'
        return 500
      when 'TEN OFF'
        return 1000 if cart_total_over_threshold?(5000, cart_id, discount)
      when 'FIFTEEN OFF'
        return 1500 if cart_total_over_threshold?(7500, cart_id, discount) &&
                       cart_has_item_from_categories?(["Men's footwear", "Women's footwear"], cart_id)
    end
  end

  private

  def self.cart_total_over_threshold?(threshold, cart_id, discount)
    Cart.find(cart_id).cart_total(discount) > threshold
  end

  def self.cart_has_item_from_categories?(categories, cart_id)
    cartitems_categories = Cart.find(cart_id).cartitems.map { |item| item.product.category }
    categories.each { |category| return true if cartitems_categories.include?(category)}
    return false
  end

end
