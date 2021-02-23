class BuyersController < ApplicationController
  
  def new
    @product = Product.find(params[:product_id])
    @buyer_address = BuyerAddress.new
  end

  def create
    @product = Product.find(params[:product_id])
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

    def pay_product
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.price,  # 商品の値段
        card: buyer_address_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

end
