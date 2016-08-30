feature 'Feature - apply vouchers to cart' do

  scenario 'Stories 4/5: As a User I can view the total price for the products in my shopping cart with discounts applied.', js: true do
    FactoryGirl.create(:product, price: 1000)
    visit products_path
    click_on 'add to cart'

    fill_in  'voucher', with: 'FIVE OFF'
    click_on 'apply voucher'

    within('#carttotal') do
      expect(page).to have_content('£5.00')
    end
  end

end
