feature 'Feature - apply vouchers to cart' do

  scenario 'Stories 4/5: As a User I can view the total price for the products in my shopping cart with discounts applied.', js: true, focus: true do
    FactoryGirl.create(:voucher)
    FactoryGirl.create(:product)

    visit products_path
    click_on 'add to cart'

    fill_in 'voucher', with: 'FIVEOFF'
    within('#carttotal') do
      expect(page).to have_content('£5.00')
    end
  end

end
