describe VouchersController, '#create' do

  context 'when the voucher is valid' do
    it 'renders the standard js response' do

      allow(Voucher).to receive(:validate_voucher) { DISCOUNT }
      post :create, xhr: true

      expect(response).to render_template(:create)
  
    end
  end 

  context 'when the voucher is not valid' do
    it 'renders the ~invalid voucher~ js response' do

      allow(Voucher).to receive(:validate_voucher) { nil }
      post :create, xhr: true

      expect(response).to render_template(:invalid_voucher)
  
    end
  end 

  DISCOUNT = 10
  
end
