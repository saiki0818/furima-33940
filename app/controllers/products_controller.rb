class ProductsController < ApplicationController

  before_action :authenticate_user!, only: [:new]
  
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end




   private

  def product_params
    params.require(:product).permit(:image, :product_name, :description, :category_id, :state_id, :deliver_fee_id, :shipment_id, :shipment_day_id, :price).merge(user_id: current_user.id)
  end


end
