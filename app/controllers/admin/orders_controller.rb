class Admin::OrdersController < ApplicationController
  def all
    @orders = Order.all
  end
end
