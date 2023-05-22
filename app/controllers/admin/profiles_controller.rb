class Admin::ProfilesController < ApplicationController
  before_action :check_admin

  def all
    @profiles = Profile.all
  end

  def show 
    @profile = Profile.find(params[:id])
  end

  private
    def check_admin
      redirect_to "/" if !session[:profile_id] || !Profile.find(session[:profile_id]).admin?
    end
end
