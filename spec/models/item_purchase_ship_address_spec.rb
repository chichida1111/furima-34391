require 'rails_helper'

RSpec.describe ItemPurchaseShipAddress, type: :model do
  before do
    item_display = FactoryBot.create(:item_display)
    user = FactoryBot.create(:user)
    @item_purchase_ship_address = FactoryBot.build(:item_purchase_ship_address, item_display_id: item_display.id, user_id: user.id )
    sleep(0.5)
  end

  describe '出品購入情報' do
    context '購入できる時' do
      it '郵便番号が7桁だと登録できる' do
        @item_purchase_ship_address.postal_code = "111-1111"
        expect(@item_purchase_ship_address).to be_valid
      end
      it '都道府県を入力すると登録できる' do
        @item_purchase_ship_address.ship_source_id = 3
        expect(@item_purchase_ship_address).to be_valid
      end
      it '市町村を入力すると登録できる' do
        @item_purchase_ship_address.city = "NY町"
        expect(@item_purchase_ship_address).to be_valid
      end
      it '番地を入力すると登録できる' do
        @item_purchase_ship_address.street = "一番地ー１"
        expect(@item_purchase_ship_address).to be_valid
      end
      it '電話番号を10桁で入力すると登録できる' do
        @item_purchase_ship_address.phone_number = "1234567890"
        expect(@item_purchase_ship_address).to be_valid
      end
      it '電話番号を11桁で入力すると登録できる' do
        @item_purchase_ship_address.phone_number = "12345678901"
        expect(@item_purchase_ship_address).to be_valid
      end
      it '建物名が空でも登録できる' do
        @item_purchase_ship_address.building_name = ""
        expect(@item_purchase_ship_address).to be_valid
      end
      it '全て揃っていれば登録できる' do
        expect(@item_purchase_ship_address).to be_valid
      end
    end
    context '購入できない時' do
      it '郵便番号が空だと登録できない' do
        @item_purchase_ship_address.postal_code = ''
        @item_purchase_ship_address.valid?
        expect(@item_purchase_ship_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号が6桁だと登録できない' do
        @item_purchase_ship_address.postal_code = '123-456'
        @item_purchase_ship_address.valid?
        expect(@item_purchase_ship_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号に”-”が入っていないと登録できない' do
        @item_purchase_ship_address.postal_code = '1234567'
        @item_purchase_ship_address.valid?
        expect(@item_purchase_ship_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県を未選択だと登録できない' do
        @item_purchase_ship_address.ship_source_id = 0
        @item_purchase_ship_address.valid?
        expect(@item_purchase_ship_address.errors.full_messages).to include("Ship source can't be blank")
      end
      it '市町村が空だと登録できない' do
        @item_purchase_ship_address.city = ""
        @item_purchase_ship_address.valid?
        expect(@item_purchase_ship_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと登録できない' do
        @item_purchase_ship_address.street = ""
        @item_purchase_ship_address.valid?
        expect(@item_purchase_ship_address.errors.full_messages).to include("Street can't be blank")
      end
      it '電話番号が空だと登録できない' do
        @item_purchase_ship_address.phone_number = ""
        @item_purchase_ship_address.valid?
        expect(@item_purchase_ship_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid. Within 11 digits")
      end
      it '電話番号が9桁だと登録できない' do
        @item_purchase_ship_address.phone_number = "123456789"
        @item_purchase_ship_address.valid?
        expect(@item_purchase_ship_address.errors.full_messages).to include("Phone number is invalid. Within 11 digits")
      end
      it '電話番号が12桁だと登録できない' do
        @item_purchase_ship_address.phone_number = "123456789012"
        @item_purchase_ship_address.valid?
        expect(@item_purchase_ship_address.errors.full_messages).to include("Phone number is invalid. Within 11 digits")
      end
      it '電話番号が文字列（全角）だと登録できない' do
        @item_purchase_ship_address.phone_number = "電話番号"
        @item_purchase_ship_address.valid?
        expect(@item_purchase_ship_address.errors.full_messages).to include("Phone number is invalid. Within 11 digits")
      end
      it '電話番号が文字列（半角英語）だと登録できない' do
        @item_purchase_ship_address.phone_number = "phonenumber"
        @item_purchase_ship_address.valid?
        expect(@item_purchase_ship_address.errors.full_messages).to include("Phone number is invalid. Within 11 digits")
      end
      it '電話番号が文字列（英数混合）だと登録できない' do
        @item_purchase_ship_address.phone_number = "090phone123"
        @item_purchase_ship_address.valid?
        expect(@item_purchase_ship_address.errors.full_messages).to include("Phone number is invalid. Within 11 digits")
      end
      it '電話番号が数値（全角）だと登録できない' do
        @item_purchase_ship_address.phone_number = "１２３４５６７８９０１"
        @item_purchase_ship_address.valid?
        expect(@item_purchase_ship_address.errors.full_messages).to include("Phone number is invalid. Within 11 digits")
      end
      it 'user_idが空だと登録できない' do
        @item_purchase_ship_address.user_id = ""
        @item_purchase_ship_address.valid?
        expect(@item_purchase_ship_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_display_idが空だと登録できない' do
        @item_purchase_ship_address.item_display_id = ""
        @item_purchase_ship_address.valid?
        expect(@item_purchase_ship_address.errors.full_messages).to include("Item display can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @item_purchase_ship_address.token = nil
        @item_purchase_ship_address.valid?
        expect(@item_purchase_ship_address.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end