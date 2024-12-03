module OrderManagement
  class AddressesController < ApplicationController
    before_action :set_address, only: [:show, :update, :destroy]

    def index
      @addresses = Address.all
      render json: AddressSerializer.new(@addresses).serializable_hash, status: :ok
    end

    def show
      render json: AddressSerializer.new(@address).serializable_hash, status: :ok
    end

    def create
      @address = Address.new(address_params)

      if @address.save
        render json: AddressSerializer.new(@address).serializable_hash, status: :created
      else
        render json: { errors: @address.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @address.update(address_params)
        render json: AddressSerializer.new(@address).serializable_hash, status: :ok
      else
        render json: { errors: @address.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @address.destroy
      render json: { success: "Address deleted successfully" }
    end

    private

    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:address, :zip_code, :contact_number, :user_id)
    end
  end
end
