describe CartitemsController do
  describe '#create' do

    context 'when item is not in stock' do

      it 'notifies the client with a plain text response' do
        test_product = FactoryGirl.create(:product, stock_quantity: 0)

        create_cartitem_with_product(test_product)
    
        expect(response.body).to eq 'cannot add to cart: not availbale in stock'
      end

    end


    context 'when item is in stock' do

      it 'creates a cartitem' do
        test_product = FactoryGirl.create(:product)

        expect { create_cartitem_with_product(test_product) }
          .to change { Cartitem.count }.by 1
      end 

      it 'creates the relation between cartitem and product' do
        test_product = FactoryGirl.create(:product)

        create_cartitem_with_product(test_product)
         
        expect(assigns(:cartitem).product).to eq(test_product)
      end

      it 'creates the relation between cartitem and cart' do
        test_product = FactoryGirl.create(:product)

        create_cartitem_with_product(test_product)
        test_cart_id = session[:cart_id]
         
        expect(assigns(:cartitem).cart.id).to eq(test_cart_id)
      end

      it 'renders the js template' do
        test_product = FactoryGirl.create(:product)

        create_cartitem_with_product(test_product)
    
        expect(response).to render_template('create')
      end
    end
  end

  def create_cartitem_with_product(product)
    post :create, xhr: true, params: { id: product.id }
  end

end
