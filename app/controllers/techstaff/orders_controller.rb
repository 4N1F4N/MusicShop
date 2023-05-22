class Techstaff::OrdersController < ApplicationController
  before_action :check_techstaff

  def all
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private
    def check_techstaff
      redirect_to "/" if !session[:profile_id] || !Profile.find(session[:profile_id]).techstaff?
    end
end
