class Order < ApplicationRecord
  belongs_to :profile
  has_many :ordered_product
  has_many :order_status

  after_create :create_status

  after_destroy :destoy_ordered_products

  def update_status(id)
    status = OrderStatus.new(status_id: id, order_id: self.id)
    status.update_status
    status.save
  end

  private
    def create_status
      status = OrderStatus.new(status_id: 1, order_id: self.id)
      status.update_status
      status.save
    end

    def destoy_ordered_products
      OrderedProduct.where(order_id: self.id).all.each do |product|
        product.destroy
      end
    end
end
