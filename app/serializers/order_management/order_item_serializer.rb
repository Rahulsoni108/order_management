module OrderManagement
  class OrderItemSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :product_id, :quantity, :price, :total_price, :created_at, :updated_at

    belongs_to :order
  end
end
