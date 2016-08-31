require_dependency "shopping_cart/application_controller"

module ShoppingCart
 class OrderItemsController < ApplicationController
   before_action :current_order, :set_product!

   def index
     @order_items = current_order.order_items
   end

   def destroy_all
     current_order.order_items.destroy_all
     flash[:success] = 'Order was successfully destroyed'
     redirect_to :back
   end

   def destroy
     current_order.order_items.find(params[:id]).destroy
     flash[:success] = 'One item from order was successfully deleted'
     redirect_to :back
   end

   def create
     if current_order.add_product(@product, params[:quantity])
       redirect_to :back, notice: t('cart.added')
     else
       redirect_to :back, alert: t('cart.not_added')
     end
   end

   def update
     params[:quantity].each do |item_id, quantity|
       current_order.order_items.find_by_id(item_id).update(:quantity => quantity)
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

   protected

   def set_product!
     class_name = ShoppingCart::PRODUCT_CLASSES.find { |c| c == params[:class] }
     @product = class_name.camelize.constantize.find( params[:format])
   end
 end
end
