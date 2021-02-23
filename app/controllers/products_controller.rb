class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :confirm_user, only: [:edit, :update, :destroy]
  before_action :confirm_buyer, only: [:edit, :update, :destroy]

  
  def index
    @products = Product.order("created_at DESC")
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

  def show

  end

  def edit

  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end


   private

   def set_product
    @product = Product.find(params[:id])
   end

  def product_params
    params.require(:product).permit(:image, :product_name, :description, :category_id, :state_id, :deliver_fee_id, :shipment_id, :shipment_day_id, :price).merge(user_id: current_user.id)
  end

  def confirm_user
    if current_user != @product.user
       redirect_to root_path
    end
  end

  def confirm_buyer
    if @product.buyer.present?
       redirect_to root_path
  end
 end

end

