class ProfilesController < ApplicationController
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

  def show
    @name = Profile.find_by(id: params[:id]).name
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

    def current_user
      Profile.find_by(id: session[:profile_id])
    end
end
