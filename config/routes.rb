OrderManagement::Engine.routes.draw do
  resources :orders
  resources :order_items
end
