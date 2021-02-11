require 'rails_helper'

RSpec.describe Product, type: :model do

  
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.build(:product, user_id: @user.id)
    @product.image = fixture_file_upload("test/fixtures/files/test_image.png")
   end

   

   describe '商品出品機能' do
     it "全ての値が正しい場合、出品できる" do
      expect(@product).to be_valid
     end
     it "商品画像を1枚つけることが必須であること" do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
     end
     it "商品名が必須であること" do
      @product.product_name = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Product name can't be blank")
     end
     it "商品の説明が必須であること" do
      @product.description = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Description can't be blank")
     end
     it "カテゴリーの情報が必須であること" do
      @product.category_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Category must be other than 1")
     end
     it "商品の状態についての情報が必須であること" do
      @product.state_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("State must be other than 1")
     end
     it "配送料の負担についての情報が必須であること" do
      @product.deliver_fee_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Deliver fee must be other than 1")
     end
     it "発送元の地域についての情報が必須であること" do
      @product.shipment_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Shipment must be other than 1")
     end
     it "発送までの日数についての情報が必須であること" do
      @product.shipment_day_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Shipment day must be other than 1")
     end
     it "販売価格についての情報が必須であること" do
      @product.price = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
     end
     it "販売価格は、¥300~¥9,999,999の間のみ保存可能であること" do
      @product.price = 50
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be greater than 299")
     end
     it "販売価格は半角数字のみ保存可能であること" do
      @product.price = '１５００'
      @product.valid?
      expect(@product.errors.full_messages).to include("Price is not a number")
    end
   end
  end