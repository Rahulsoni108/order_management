module OrderManagement
  class OrderItemsController < ApplicationController
    before_action :set_order, only: [ :show, :update, :destroy ]

    def index
      @order_items = OrderManagement::OrderItem.all
      render json: OrderManagement::OrderItemSerializer.new(@order_items).serializable_hash, status: :ok
    end

    def show
      render json: OrderManagement::OrderItemSerializer.new(@order_item).serializable_hash, status: :ok
    end

    def create
      @order_item = OrderManagement::OrderItem.new(order_item_params)
      if @order_item.save
        render json: OrderManagement::OrderItemSerializer.new(@order_item).serializable_hash, status: :created
      else
        render json: { errors: @order_item.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @order_item.update(order_item_params)
        render json: OrderManagement::OrderItemSerializer.new(@order_item).serializable_hash, status: :ok
      else
        render json: { errors: @orderItem.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @order_item.destroy
      head :no_content
    end

    private

    def set_order
      @order_item = OrderManagement::OrderItem.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Order Items not found" }, status: :not_found
    end

    def order_item_params
      params.require(:order_item).permit(:id, :product_varient_id, :quantity, :price, :order_id)
    end
  end
end
