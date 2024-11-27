class CreateOrders < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :orders do |t|
      t.string :status
      t.decimal :total_amount, precision: 10, scale: 2
      t.datetime :order_place_date
      t.timestamps
    end
    add_reference :orders, :user, index: true
    add_reference :orders, :address, index: true
  end
end
