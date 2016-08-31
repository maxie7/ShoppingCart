require 'rails_helper'

module ShoppingCart
  feature 'view all order items, and manipulate with them' do
    given(:customer) {FactoryGirl.create(:customer)}
    given!(:product) {FactoryGirl.create(:product)}
    given!(:order_item) {FactoryGirl.create(:order_item, product: product, quantity: 3)}
    given(:order){FactoryGirl.create(:order, customer: customer, order_item: order_item)}

    before do
      login_as customer
      visit order_items_path
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
      expect(page).to have_content 'Shopping cart is empty... Get started shopping!'
    end

    scenario 'click on CONTINUE SHOPPING' do
      click_on 'CONTINUE SHOPPING'

      expect(page).to have_content product.title
      expect(page).to have_content number_to_currency product.price
      expect(page).to have_content number_to_currency product.price*3
      expect(page).not_to have_content 'EMPTY'
    end
  end
end
