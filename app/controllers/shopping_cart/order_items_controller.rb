require_dependency "shopping_cart/application_controller"

module ShoppingCart
 class OrderItemsController < ApplicationController
   before_action :current_order

   def index
     @order_items = @order.order_items
   end

   def destroy_all
     @order.order_items.destroy_all
     flash[:success] = 'Order was successfully destroyed'
     redirect_to :back
   end

   def destroy
     @order.order_items.find(params[:id]).destroy
     flash[:success] = 'One item from order was successfully deleted'
     redirect_to :back
   end

   def create
     product = ShoppingCart.product_class.find_by_id(order_params[:product_id])
     quantity = order_params[:quantity]
     @order.add_product(product,quantity.to_i)
     flash[:success] = 'Product was successfully added to cart.'
     redirect_to(:back)
   end

   def update
     params[:quantity].each do |item_id, quantity|
       @order.order_items.find_by_id(item_id).update(:quantity => quantity)
     end
     add_coupon unless params[:coupon].blank?
     flash[:success] = 'Order was successfully updated' if flash[:danger].nil?
     redirect_to :back
   end

   private

   def add_coupon
     @coupon = Coupon.find_by(number: params[:coupon])
     if @coupon
       if @order.coupon
         flash[:danger] = 'You already use coupon code'
       else
         @order.update(coupon: @coupon)
         flash[:success] = 'Coupon code has been accepted'
       end
     else
       flash[:danger] = 'Coupon not found'
     end
   end

   def current_order
     @order = current_customer.order_in_progress
   end

   def order_params
     params.require(:orders).permit(:product_id, :quantity )
   end
 end
end
