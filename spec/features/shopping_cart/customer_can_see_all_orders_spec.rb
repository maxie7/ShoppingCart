require 'rails_helper'

module ShoppingCart
  feature 'Add book' do
    given(:customer) {FactoryGirl.create(:customer)}

    before do
      login_as customer
      visit orders_path
    end
    given!(:product) {FactoryGirl.create(:product, id:1, price: 10)}
    scenario 'Customer without any order' do
      expect(page).to have_content("Lets go shopping!")
    end

    scenario 'Customer can see order in progress' do
      visit book_path(1)
      click_button 'Add to Cart'
      visit orders_path

      expect(page).not_to have_content("Lets go shopping!")
      expect(page).to have_content("#{product.title}")
      expect(page).to have_content("#{product.price}")
    end

  end
end
