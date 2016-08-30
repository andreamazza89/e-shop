describe Cart, '#total_price_in_pounds' do

  let(:cart) { described_class.create }

  context 'when there are no discounts' do

    let(:discount) { 0 }

    context 'when there are no items in the cart' do
      it 'returns string 0.00' do
        expect(cart.total_price_in_pounds(discount)).to eq('0.00')
      end 
    end

    context 'when there are items in the cart' do
      it 'returns the total price as an appropriately formatted string ' do
        shoe  = FactoryGirl.create(:product, name: 'shoe', price: 1010) 
        shirt = FactoryGirl.create(:product, name: 'shirt', price: 2030) 

        add_product_to_cart(shoe, cart)
        add_product_to_cart(shirt, cart)
        
        expect(cart.total_price_in_pounds(discount)).to eq('30.40')
      end 
    end
  end

  context 'when there are discounts' do

    let(:discount) { 1000 }

    it 'returns the total price as an appropriately formatted string ' do
      shoe  = FactoryGirl.create(:product, name: 'shoe', price: 1010) 
      shirt = FactoryGirl.create(:product, name: 'shirt', price: 2030) 

      add_product_to_cart(shoe, cart)
      add_product_to_cart(shirt, cart)
      
      expect(cart.total_price_in_pounds(discount)).to eq('20.40')
    end 
  end
end
