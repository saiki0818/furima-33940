require 'rails_helper'

RSpec.describe Product, type: :model do

  
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.build(:product, user_id: @user.id)
    @product.image = fixture_file_upload("test/fixtures/files/test_image.png")
   end

   

   describe '商品出品機能' do
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
      @product.category_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
     end
     it "商品の状態についての情報が必須であること" do
      @product.state_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("State can't be blank")
     end
     it "配送料の負担についての情報が必須であること" do
      @product.deliver_fee_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Deliver fee can't be blank")
     end
     it "発送元の地域についての情報が必須であること" do
      @product.shipment_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Shipment can't be blank")
     end
     it "発送までの日数についての情報が必須であること" do
      @product.shipment_day_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Shipment day can't be blank")
     end
     it "販売価格についての情報が必須であること" do
      @product.price = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
     end
     it "販売価格は、¥300~¥9,999,999の間のみ保存可能であること" do
      @product.price = '50'
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