feature 'Feature - Show total price of items in cart' do

  scenario 'Story 3: As a User I can view the total price for the products in my shopping cart.', js: true do
    shoe  = FactoryGirl.create(:product, name: 'shoe', price: 1010) 
    shirt = FactoryGirl.create(:product, name: 'shirt', price: 2030) 
    visit products_path 

    within '#products-table tbody tr:nth-child(2)' do
      click_on 'add to cart'
    end

    within '#products-table tbody tr:nth-child(3)' do
      click_on 'add to cart'
    end

    within '#carttotal' do
      expect(page).to have_content 'Total price: £30.40'
    end
  end

end

