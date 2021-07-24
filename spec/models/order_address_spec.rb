require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  describe '購入者情報の登録' do
    context '購入者情報が登録できるとき' do
      it '全ての情報が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも登録できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '購入者情報が登録できないとき'do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeがハイフン無しでは登録できないこと' do
        @order_address.postal_code = '4880001'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idが選択されていなければ登録できないこと' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では登録できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では登録でいきないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが数字以外の文字が含まれていると登録できないこと' do
        @order_address.phone_number = '090-7694-2240'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberが9桁以下では登録できないこと'do
        @order_address.phone_number ='090769422'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number  is too short ")
      end
    end
  end
end
