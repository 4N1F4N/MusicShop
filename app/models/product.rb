class Product < ApplicationRecord
  after_destroy :destroy_ordered_products

  has_one :tag

  private
    def destroy_ordered_products
      OrderedProduct.where(product_id: self.id).all.each do |product|
        product.destroy
      end
    end
end
