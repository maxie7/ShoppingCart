require 'rails_helper'

module ShoppingCart
  RSpec.describe OrderItemsController, type: :controller

  let(:customer) { FactoryGirl.create(:customer) }

  before do
    sign_in customer
  end

  let!(:order) { FactoryGirl.create(:order, customer: customer) }
  let!(:product) { FactoryGirl.create(:product, id: 1) }
  let(:order_item) { FactoryGirl.create(:order_item, order: order, product: product, quantity: 1) }

  describe 'GET #index' do

    before do
      get :index
      customer.reload
    end

    it '#current_order' do
      expect(controller).to receive(:current_order)
      get :index
    end

    it 'create order' do
      expect(order).not_to be_nil
    end

    it 'have order item' do
      expect(order.order_items).not_to be_nil
    end
  end

  describe 'POST #create' do
    before { request.env['HTTP_REFERER'] = root_path }
    it 'add book to order_items' do
      book2 = FactoryGirl.create(:product, id: 2)
      book3 = FactoryGirl.create(:product, id: 3)
      post :create, orders: {quantity: 2 , book_id: 2}
      post :create, orders:{quantity: 2, book_id: 3}
      order.reload
      expect(OrderItem.count).to eq 2
    end

  end

  describe 'POST #update_all' do
    it 'change quantity' do
      post :update, "quantity"=>{"#{order_item.id}"=>"3"}
      order_item.reload
      expect(order_item.quantity).to eq(3)
    end
  end

  describe 'DELETE #destroy' do
    it 'delete one current order item from order' do
      delete :destroy, {id: order_item.id}
      order.reload
      expect(order.order_items).not_to include order_item
    end
  end

  describe 'DELETE #destroy_all' do
    it 'delete all order items from current order' do
      delete :destroy_all
      order.reload
      expect(order.order_items).to be_blank
    end

  end
end
