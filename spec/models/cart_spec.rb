describe Cart, '#total_price_in_pounds' do

  let(:cart) { described_class.create }

  context 'when there are no items in the cart' do
    it 'returns string 0.00' do
      expect(cart.total_price_in_pounds).to eq('0.00')
    end 
  end

  context 'when there are items in the cart' do
    it 'returns the total price as an appropriately formatted string ' do
      shoe  = Product.create(name: 'shoe', category: 'test category', price: 1010, stock_quantity: 4) 
      shirt = Product.create(name: 'shirt', category: 'test category', price: 2030, stock_quantity: 4) 

      shoe_cart_item = Cartitem.new 
      shoe_cart_item.product = shoe
      shoe_cart_item.cart = cart
      shoe_cart_item.save

      shirt_cart_item = Cartitem.new 
      shirt_cart_item.product = shirt
      shirt_cart_item.cart = cart
      shirt_cart_item.save
      
      expect(cart.total_price_in_pounds).to eq('30.40')
    end 
  end
   
end
