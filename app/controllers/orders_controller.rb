class OrdersController < ApplicationController
  def create
    if session[:profile_id]
      order = Order.new(profile_id: session[:profile_id])
      order.save
      Profile.find_by(id:session[:profile_id]).cart.ordered_product.each do |product|
        product.order_id = order.id
        product.cart_id = nil
        product.save
      end
      
      redirect_to profile_order_path(order.id)
    end
  end
end
