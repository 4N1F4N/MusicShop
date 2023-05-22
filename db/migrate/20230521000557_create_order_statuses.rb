class CreateOrderStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :order_statuses do |t|
      t.string :title
      t.integer :status_id
      t.belongs_to :order

      t.timestamps
    end
    
    Order.all.each do |order|
      order.update_status(1)
    end
  end
end
