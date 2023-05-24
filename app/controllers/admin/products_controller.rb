class Admin::ProductsController < ApplicationController
  before_action :check_admin

  def all
    @products = Product.all
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    Product.create(propucts_params)

    redirect_to admin_all_products_path
  end

  def change
    product = Product.find(params[:id])

    product.update(product_params)

    redirect_to admin_all_products_path
  end

  def destroy
    Product.find(params[:id]).destroy

    redirect_to admin_all_products_path
  end

  private
    def check_admin
      redirect_to "/" if !session[:profile_id] || !Profile.find(session[:profile_id]).admin?
    end

    def product_params
      params.require(:product).permit(:title, :price)
    end
end
