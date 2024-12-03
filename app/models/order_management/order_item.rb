module OrderManagement
  class OrderItem < ApplicationRecord
    self.table_name = "order_items"

    belongs_to :order
    belongs_to :item, class_name: 'InventoryManager::Item'

    validates :quantity, numericality: { less_than_or_equal_to: :available_quantity, greater_than_or_equal_to: 1 }, on: :create

    before_save :set_price

    private
    def set_price
      self[:price] = quantity * item.price
    end

    def available_quantity
      item&.quantity || 0
    end
  end
end
