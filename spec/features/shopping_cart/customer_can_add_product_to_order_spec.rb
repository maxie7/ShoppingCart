require 'rails_helper'

feature 'Add book' do
  given(:customer) {FactoryGirl.create(:customer)}

  before do
    login_as customer
    visit book_path(product)
  end
  given!(:product) {FactoryGirl.create(:product)}

  scenario 'Customer add book to cart' do
    fill_in 'orders[quantity]', with: 3
    click_button 'Add to Cart'

    expect(page).not_to have_content 'EMPTY'
    expect(page).to have_content '(3)'
    expect(page).to have_content number_to_currency product.price*3
  end
end
