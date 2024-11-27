Rails.application.routes.draw do
  mount OrderManagement::Engine => "/order_management"
end
