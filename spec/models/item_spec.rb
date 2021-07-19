require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do
    context '商品情報が保存できる場合' do
      it '全ての情報が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
      it 'priceが300円なら保存できること' do
        @item.price = '300'
        expect(@item).to be_valid
      end
      it 'priceが9999999円なら保存できること' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
    end
    context '商品情報が保存できない場合' do
      it 'imageが空では保存きないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では保存できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoが空では保存できないこと' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'category_idが0では保存できないこと' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it 'sales_status_idが0では保存できなこと' do
        @item.sales_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status must be other than 0')
      end
      it 'shipping_fee_status_idが0では保存できないこと' do
        @item.shipping_fee_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status must be other than 0')
      end
      it 'prefecture_idが0では保存できないこと' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'schduled_delivery_idが0では保存できないこと' do
        @item.scheduled_delivery_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery must be other than 0')
      end
      it 'priceが空では保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字では保存できないこと' do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが300円未満では保存できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが10000000円以上では保存できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
