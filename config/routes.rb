OrderManagement::Engine.routes.draw do
  resources :orders
  resources :order_items
  resources :addresses
end
