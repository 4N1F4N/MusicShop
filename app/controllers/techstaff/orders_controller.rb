class Techstaff::OrdersController < ApplicationController
  before_action :check_techstaff

  def all
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def change 
    status = OrderStatus.where(order_id: params[:id]).last
    Order.find(params[:id]).update_status(status.status_id + 1) if status.can_up

    redirect_to techstaff_all_orders_path
  end

  private
    def check_techstaff
      redirect_to "/" if !session[:profile_id] || !Profile.find(session[:profile_id]).techstaff?
    end
end
