class ProfilesController < ApplicationController
  before_action :check_profile, only: [:order, :show]

  def show
    @profile = Profile.find(session[:profile_id])
    @orders = @profile.order.all.reverse
  end

  def order 
    @order = Order.find(params[:id])
  end

  def pay

  end

  def pay_order
    status = OrderStatus.where(order_id: params[:id]).last
    Order.find(params[:id]).update_status(status.status_id + 1) if status.can_pay

    redirect_to profile_path
  end

  def login

  end

  def check
    profile = Profile.find_by(name:login_params[:name])
    if profile && profile.authenticate(login_params[:password])
      session[:profile_id] = profile.id
      session[:cart_id] = profile.cart.id
    else
      redirect_to login_path
    end
    redirect_to profile_path(profile)
  end

  def signup
    
  end

  def create
    profile = Profile.new(signup_params)
    if (profile.save)
      session[:profile_id] = profile.id
      session[:cart_id] = profile.cart.id
      redirect_to profile_path(profile)
    end
  end

  def logout
    if session[:profile_id]
      session.delete(:profile_id)
      session.delete(:cart_id)
    end
    redirect_to "/"
  end

  private 
    def login_params
      params.require(:login).permit(:name, :password)
    end

    def signup_params
      params.require(:signup).permit(:name, :password)
    end

    def check_profile
      redirect_to "/" if !session[:profile_id]
    end
end
