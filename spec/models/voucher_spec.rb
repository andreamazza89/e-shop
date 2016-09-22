describe Voucher, ':validate_voucher' do

  let(:cart) { Cart.create }

  context 'in any context' do

    it 'returns 500 for FIVE OFF' do
      expect(Voucher.validate_voucher('FIVE OFF', cart.id, 0)).to eq(500)
    end

    it 'returns nil for invalid code' do
      expect(Voucher.validate_voucher('WRONG CODE', cart.id, 0)).to be nil
    end

  end
  
  context 'when the items in the cart are above £50' do

    before(:each) do
      shoe = FactoryGirl.create(:product, price: 5001, category: 'Mens footwear') 
      add_product_to_cart(shoe, cart)
    end

    it 'returns 1000 for TEN OFF' do
      expect(Voucher.validate_voucher('TEN OFF', cart.id, 0)).to eq(1000)
    end

    it 'returns nil for FIFTEEN OFF' do
      expect(Voucher.validate_voucher('FIFTEEN OFF', cart.id, 0)).to be nil
    end

  end

  context 'when the items in the cart are above £75 and category not footwear' do

    before(:each) do
      top = FactoryGirl.create(:product, price: 7501, category: 'tops') 
      add_product_to_cart(top, cart)
    end

    it 'returns nil for FIFTEEN OFF' do
      expect(Voucher.validate_voucher('FIFTEEN OFF', cart.id, 0)).to be nil
    end

  end

  context 'when the items in the cart are above £75 and category is footwear' do

    before(:each) do
      shoe = FactoryGirl.create(:product, price: 7501, category: "Men's footwear") 
      add_product_to_cart(shoe, cart)
    end

    it 'returns 1500 for FIFTEEN OFF' do
      expect(Voucher.validate_voucher('FIFTEEN OFF', cart.id, 0)).to eq(1500)
    end

  end
  
end
