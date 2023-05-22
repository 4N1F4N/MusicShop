class Order < ApplicationRecord
  belongs_to :profile
  has_many :ordered_product
  has_many :order_status

  after_create :create_status

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
end
