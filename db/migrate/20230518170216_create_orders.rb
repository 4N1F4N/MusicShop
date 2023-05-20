class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.belongs_to :profile

      t.timestamps
    end

    add_reference :ordered_products, :order, index: true
  end
end
