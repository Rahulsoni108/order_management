module OrderManagement
  class OrderSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :customer_id, :status, :total_amount, :created_at, :updated_at

    has_many :order_items
  end
end
