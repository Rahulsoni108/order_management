module OrderManagement
  class AddressSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :zip_code, :contact_number, :user_id
  end
end
