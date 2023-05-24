class Product < ApplicationRecord
  after_destroy :destroy_ordered_products

  private
    def destroy_ordered_products
      OrderedProduct.where(product_id: self.id).all.each do |product|
        product.destroy
      end
    end
end
