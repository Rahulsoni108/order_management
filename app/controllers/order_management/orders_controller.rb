module OrderManagement
  class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :update, :destroy]

    def index
      @orders = OrderManagement::Order.all
      render json: OrderManagement::OrderSerializer.new(@orders).serializable_hash, status: :ok
    end

    def show
      render json: OrderManagement::OrderSerializer.new(@order).serializable_hash, status: :ok
    end

    def create
      @order = OrderManagement::Order.new(order_params)
      if @order.save
        render json: OrderManagement::OrderSerializer.new(@order).serializable_hash, status: :created
      else
        render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @order.update(order_params)
        render json: OrderManagement::OrderSerializer.new(@order).serializable_hash, status: :ok
      else
        render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @order.destroy
      head :no_content
    end

    private

    def set_order
      @order = OrderManagement::Order.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Order not found' }, status: :not_found
    end

    def order_params
      params.require(:order).permit(:customer_id, :status, :total_amount)
    end
  end
end
