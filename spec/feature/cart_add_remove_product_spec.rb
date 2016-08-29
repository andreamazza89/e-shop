feature 'Feature - Add/remove items to shopping cart' do

  scenario 'Story 1: As a User I can add a product to my shopping cart.', js: true do
    Product.create(name: 'test product', category: 'test category', price: 1234, stock_quantity: 4) 
    visit products_path
    click_on 'add to cart'
    within '#cart' do
      expect(page).to have_content 'test product'
    end
  end

  scenario 'Story 2: As a User I can remove a product from my shopping cart.', js: true do
    Product.create(name: 'test product', category: 'test category', price: 1234, stock_quantity: 4) 
    visit products_path
    click_on 'add to cart'
    within '#cart' do
      click_on 'remove from cart'
      expect(page).not_to have_content 'test product'
    end
  end

end
