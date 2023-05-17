class CreateOrderedProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :ordered_products do |t|
      t.belongs_to :cart
      t.belongs_to :product

      t.timestamps
    end
  end
end
