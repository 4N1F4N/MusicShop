class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new 
    @product = Product.new()
  end

  def create
    @product = Product.new(title: (0...20).map { ('a'..'z').to_a[rand(26)] }.join, price: rand(1.0..10.0).round(2), count: rand(1..5))

    @product.save

    #redirect_to new_product_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end
end
