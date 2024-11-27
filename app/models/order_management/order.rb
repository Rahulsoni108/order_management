module OrderManagement
  class Order < ApplicationRecord
    self.table_name = 'orders'

    has_many :order_items, dependent: :destroy
    belongs_to :customer

  end
end
