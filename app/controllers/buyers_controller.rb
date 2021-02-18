class BuyersController < ApplicationController
  
  def new
    @product = Product.find(params[:product_id])
    @buyer_address = BuyerAddress.new
  end

  def create
    @product = Product.find(params[:product_id])
    @buyer_address = BuyerAddress.new(buyer_address_params)
    if @buyer_address.valid?
      @buyer_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def buyer_address_params
      params.require(:buyer_address).permit(:postel_code, :shipment_id, :city, :house_number, :building, :tell).merge(user_id: current_user.id, product_id: params[:product_id] )
    end


end
