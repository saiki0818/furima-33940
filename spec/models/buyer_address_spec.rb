require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do

    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.create(:product)
      @buyer_address = FactoryBot.build(:buyer_address, user_id: @user.id, product_id: @product.id)
      sleep 0.1
    end

describe '商品の購入' do
  context '購入できるとき' do
    it '全ての情報を正しく入力すれば購入できる' do
      expect(@buyer_address).to be_valid
    end
  end

  context '購入できないとき' do
    it 'user_idが空では保存できないこと' do
      @buyer_address.user_id = ""
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("User can't be blank")
    end
    it 'product_idが空では保存できないこと' do
      @buyer_address.product_id = ""
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Product can't be blank")
    end
    it '郵便番号が入力必須であること' do
      @buyer_address.postal_code = ""
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号はハイフンなしで購入できないこと' do
      @buyer_address.postal_code = "4003000"
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '郵便番号は半角数字でないと購入できないこと' do
      @buyer_address.postal_code = "６５４-２３４５"
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県の入力が必須であること' do
      @buyer_address.shipment_id = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Shipment can't be blank")
    end
    it '都道府県の入力が必須であること' do
      @buyer_address.shipment_id = 1
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Shipment must be other than 1")
    end
    it '市町村の入力が必須であること' do
    @buyer_address.city = ""
    @buyer_address.valid?
    expect(@buyer_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地の入力が必須であること' do
      @buyer_address.house_number = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("House number can't be blank")
    end
    it '電話番号の入力が必須であること' do
      @buyer_address.tell = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Tell can't be blank")
    end
    it '電話番号は数値のみで入力が必須であること' do
      @buyer_address.tell = '0801234asdf'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Tell is invalid")
    end
    it '電話番号は半角数字のみで入力しなければいけないこと' do
      @buyer_address.tell = '１２３４５６７８９０１'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Tell is invalid")
    end
    it '電話番号は11桁以内の数値のみで入力しなければいけないこと' do
      @buyer_address.tell = '111122223333'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Tell is invalid")
    end
    it "tokenが空では登録できないこと" do
      @buyer_address.token = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
    end
   end
  end
 end
