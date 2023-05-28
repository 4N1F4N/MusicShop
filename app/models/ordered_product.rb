class OrderedProduct < ApplicationRecord
  has_one :cart
  has_one :product
  has_one :order

  after_destroy :destroy_order

  private
    def destroy_order
      Order.find(self.order_id).destroy
    end
end
