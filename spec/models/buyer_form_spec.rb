require 'rails_helper'

RSpec.describe BuyerForm, type: :model do
  before do
    @buyer_form = FactoryBot.build(:buyer_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @buyer_form.user_id = 1
        expect(@buyer_form).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @buyer_form.item_id = 1
        expect(@buyer_form).to be_valid
      end
      it '郵便番号が「3桁+ハイフン+4桁」の組み合わせであれば保存できる' do
        @buyer_form.postcode = '123-4560'
        expect(@buyer_form).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @buyer_form.shipping_area_id = 5
        expect(@buyer_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @buyer_form.city = '横浜市'
        expect(@buyer_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @buyer_form.address = '旭区１２３'
        expect(@buyer_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @buyer_form.building = nil
        expect(@buyer_form).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @buyer_form.phone_number = 12_345_678_910
        expect(@buyer_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @buyer_form.user_id = nil
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @buyer_form.item_id = nil
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @buyer_form.postcode = nil
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Postcode can't be blank", 'Postcode is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @buyer_form.postcode = 1_234_567
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @buyer_form.shipping_area_id = 0
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @buyer_form.shipping_area_id = nil
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @buyer_form.city = nil
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @buyer_form.address = nil
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @buyer_form.phone_number = nil
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @buyer_form.phone_number = '123 - 4567 - 8910'
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @buyer_form.phone_number = 12_345_678_910_111_213
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @buyer_form.token = nil
        @buyer_form.valid?
        expect(@buyer_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
