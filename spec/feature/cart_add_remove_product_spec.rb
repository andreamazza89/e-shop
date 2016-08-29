feature 'Feature - Add/remove items to shopping cart' do

  before(:each) do
    FactoryGirl.create(:product)
    visit products_path
    click_on 'add to cart'
  end

  scenario 'Story 1: As a User I can add a product to my shopping cart.', js: true do
    within '#cart' do
      expect(page).to have_content 'shoe'
    end
  end

  scenario 'Story 2: As a User I can remove a product from my shopping cart.', js: true do
    within '#cart' do
      click_on 'remove from cart'
      expect(page).not_to have_content 'shoe'
    end
  end

end
