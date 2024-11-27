module OrderManagement
  class OrderItem < ApplicationRecord
    self.table_name = 'order_items'

    belongs_to :order
    belongs_to :product

    validates :quantity, numericality: { greater_than_or_equal_to: 1 }
    validates :price, numericality: { greater_than: 0 }
  end
end
