class PagesController < ApplicationController
  before_action :check_admin, only: [:links]

  def links
    
  end

  def main
    @products = Product.all
  end

  def search
    @products = Product.all
    @tag_id = 0

    if params[:tag_id] && !(params[:tag_id] == "")
      @tag_id = params[:tag_id].to_i
      @products = Product.where(tag_id: params[:tag_id]).all
    end
  end

  def about

  end

  private
    def check_admin
      redirect_to "/" if !session[:profile_id] || !Profile.find(session[:profile_id]).admin?
    end

end
