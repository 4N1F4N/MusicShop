class Product < ApplicationRecord
  after_destroy :destroy_ordered_pruducts

  private
    def destroy_ordered_pruducts
      OrderedProduct.where(product_id: self.id).all.each do |product|
        product.destroy
      end
    end
end
