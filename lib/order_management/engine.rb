module OrderManagement
  class Engine < ::Rails::Engine
    isolate_namespace OrderManagement

    config.to_prepare do
      OrderManagement::Engine.routes.draw do
        resources :orders
        resources :order_items
      end
    end
  end
end
