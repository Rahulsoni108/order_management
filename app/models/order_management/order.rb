module OrderManagement
  class Order < ApplicationRecord
    self.table_name = "orders"

    has_many :order_items, dependent: :destroy
    belongs_to :user
    belongs_to :address

    enum :status, { pending: 0, processing: 1, shipped: 2, delivered: 3, cancelled: 4 }

    after_update :update_item_quantities, if: :status_processing?

    private

    def status_processing?
      status_previously_changed?(from: 'pending', to: "processing")
    end

    def update_item_quantities
      order_items.each do |order_item|
        order_item.item.update_quantity(order_item.quantity)
      end
    end
  end
end
