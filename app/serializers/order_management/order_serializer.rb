module OrderManagement
  class OrderSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :user_id, :status, :total_amount, :order_place_date, :address_id, :created_at, :updated_at

    has_many :order_items
  end
end
