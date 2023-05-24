class PagesController < ApplicationController
  before_action :check_admin, only: [:links]

  def links
    
  end

  private
    def check_admin
      redirect_to "/" if !session[:profile_id] || !Profile.find(session[:profile_id]).admin?
    end
end
