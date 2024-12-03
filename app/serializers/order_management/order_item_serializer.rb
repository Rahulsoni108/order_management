module OrderManagement
  class OrderItemSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :item_id, :quantity, :price, :created_at, :updated_at

    belongs_to :order
  end
end
