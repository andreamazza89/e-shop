feature 'Feature - Out of stock items cannot be purchased' do

  scenario 'Story 7: As a User I am unable to Out of Stock products to the shopping cart.', js: true do
    FactoryGirl.create(:product, name: 'shoe', stock_quantity: 0)
    visit products_path
    click_on 'add to cart'

    within '#cart' do
      expect(page).not_to have_content 'shoe'
    end
  end

end
