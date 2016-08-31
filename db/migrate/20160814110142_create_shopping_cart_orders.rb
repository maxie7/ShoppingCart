class CreateShoppingCartOrders < ActiveRecord::Migration
  def change
    create_table :shopping_cart_orders do |t|
      t.decimal :total_price
      t.string :state
      t.string :number
      t.integer :delivery_price
      t.belongs_to :customer, polymorphic: true
      t.belongs_to :coupon
      t.belongs_to :order_item
      t.belongs_to :billing_address
      t.belongs_to :shipping_address
      t.belongs_to :delivery_method
      t.belongs_to :credit_card
      t.datetime :completed_date

      t.timestamps null: false
    end
  end
end
