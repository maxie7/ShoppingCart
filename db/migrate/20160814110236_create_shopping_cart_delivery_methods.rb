class CreateShoppingCartDeliveryMethods < ActiveRecord::Migration
  def change
    create_table :shopping_cart_delivery_methods do |t|
      t.string   :name
      t.decimal  :price
      t.integer  :state

      t.timestamps null: false
    end
  end
end
