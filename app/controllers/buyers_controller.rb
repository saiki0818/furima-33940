class BuyersController < ApplicationController
  before_action :set_product, only: [:new, :create]
  before_action :confirm_user, only: [:new, :create]
  before_action :authenticate_user!

  
  def new
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_address_params)
    if @buyer_address.valid?
      pay_product
      @buyer_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def buyer_address_params
      params.require(:buyer_address).permit(:postal_code, :shipment_id, :city, :house_number, :building, :tell).merge(user_id: current_user.id, product_id: params[:product_id],token: params[:token] )
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    def pay_product
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.price,
        card: buyer_address_params[:token],
        currency: 'jpy'
      )
    end

    def confirm_user
      if current_user == @product.user || @product.buyer.present?
        redirect_to root_path
      end
    end

end
