require 'features/features_spec_helper'

feature 'view all order items, and manipulate with them' do
  given(:customer) {FactoryGirl.create(:customer)}

  before do
    login_as customer
    visit book_path(product)
    fill_in 'orders[quantity]', with: 3
    click_button 'Add to Cart'
    click_on 'CART'
  end
  given!(:product) {FactoryGirl.create(:product)}


  scenario 'view all order_items' do
    expect(page).to have_content product.title
    expect(page).to have_content 'EMPTY CART'
    expect(page).to have_content 'CONTINUE SHOPPING'
    expect(page).to have_content 'CHECKOUT'
    expect(page).to have_content 'SUBTOTAL'
    expect(page).to have_content product.description
    expect(page).to have_content number_to_currency product.price*3
  end

  scenario 'change quantity of book' do
    fill_in "quantity[#{product.id}]", with: 5
    click_button 'UPDATE'

    expect(page).to have_content product.title
    expect(page).to have_content number_to_currency product.price*5
  end

  scenario 'click on EMPTY CART' do
    click_on 'EMPTY CART'

    expect(page).not_to have_content product.title
    expect(page).not_to have_content 'SUBTOTAL'
    expect(page).not_to have_content product.description
    expect(page).to have_content 'Shopping cart is empty... Lets go shopping!'
  end

  scenario 'click on CONTINUE SHOPPING' do
    click_on 'CONTINUE SHOPPING'

    expect(page).to have_content product.title
    expect(page).to have_content number_to_currency product.price
    expect(page).to have_content number_to_currency product.price*3
    expect(page).not_to have_content 'EMPTY'
  end

end
