class ProductsController < ApplicationController
  def all
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new 
    @product = Product.new()
  end

  def create
    @product = Product.new(product_params)
    @product.save

    redirect_to new_product_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:title, :price)
    end
end
