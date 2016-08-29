feature 'Feature - Show total price of items in cart' do

  scenario 'Story 3: As a User I can view the total price for the products in my shopping cart.', js: true do
    shoe  = Product.create(name: 'shoe', category: 'test category', price: 1000, stock_quantity: 4) 
    shirt = Product.create(name: 'shirt', category: 'test category', price: 2000, stock_quantity: 4) 
    visit products_path 

    within '#products-table tbody tr:nth-child(2)' do
      click_on 'add to cart'
    end

    within '#products-table tbody tr:nth-child(3)' do
      click_on 'add to cart'
    end



    within '#carttotal' do
      expect(page).to have_content 'Total price: £30.00'
    end
  end

end

