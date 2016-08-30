feature 'Feature - user is notified if invalid voucher is entered' do

  scenario 'Story 6: As a User I am alerted when I apply an invalid voucher to my shopping cart.', js: true do

    visit products_path
    fill_in  'voucher', with: 'BAD CODE'
    click_on 'apply voucher'

    expect(page).to have_content 'Invalid voucher code or voucher conditions not met'
  end

end
