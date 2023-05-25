class CartsController < ApplicationController
  before_action :check_cart

  def index
    @products = Array.new

    Profile.find_by(id:session[:profile_id]).cart.ordered_product.each do |product|
      @products.push(Product.find_by(id: product.product_id))
    end
  end

  def add_product
    product = OrderedProduct.new(product_params)
    product.save
    redirect_to main_path
  end

  def delete_product
    product = OrderedProduct.find_by(cart_id: product_params[:cart_id], product_id: product_params[:product_id])
    product.destroy
    redirect_to cart_path
  end

  private
    def product_params
      params.require(:product).permit(:cart_id, :product_id)
    end

    def check_cart
      redirect_to "/" if !session[:profile_id] || !Cart.find_by(profile_id: session[:profile_id])
    end
end
