module OrderManagement
  class OrdersController < ApplicationController
    before_action :set_order, only: [ :show, :update, :destroy ]

    def index
      @orders = Order.all
      render json: OrderSerializer.new(@orders).serializable_hash, status: :ok
    end

    def show
      render json: OrderSerializer.new(@order).serializable_hash, status: :ok
    end

    def create
      @order = Order.new(order_params)
      if @order.save
        render json: OrderSerializer.new(@order).serializable_hash, status: :created
      else
        render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @order.update(order_params)
        render json: OrderSerializer.new(@order).serializable_hash, status: :ok
      else
        render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @order.destroy
      render json: { success: "Order deleted successfully" }
    end

    private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:user_id, :status, :total_amount, :order_place_date, :address_id)
    end
  end
end
