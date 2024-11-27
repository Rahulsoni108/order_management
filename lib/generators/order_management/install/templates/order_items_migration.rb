class CreateOrderItems < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :price
      t.timestamps
    end
    add_reference :order_items, :order, index: true
    add_reference :order_items, :product_varient, index: true
  end
end
