require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do

    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.create(:product)
      @buyer_address = FactoryBot.build(:buyer_address, user_id: @user.id, product_id: @product.id)
      binding.pry
      
    end

describe '商品の購入' do
  context '購入できるとき' do
    it '全ての情報を正しく入力すれば購入できる' do
      expect(@buyer_address).to be_valid
    end
  end

  context '購入できないとき' do
    it '郵便番号が入力必須であること' do
    end
  end
end
end
