require 'rails_helper'

RSpec.describe ItemDisplay, type: :model do
  before do
    @item_display = FactoryBot.build(:item_display)
  end

 describe '出品情報登録' do
  context '出品できる時' do
    it '販売価格が300円以上だと登録できる' do
      @item_display.item_price = 500
      expect(@item_display).to be_valid
    end
    it '販売価格が10,000,000円未満だと登録できる' do
      @item_display.item_price = 9999999
      expect(@item_display).to be_valid
    end
    it '販売価格が半角数字で入力すれば登録できる' do
      @item_display.item_price = 1000000
      expect(@item_display).to be_valid
    end
    it '全て揃っていれば登録できる' do
      expect(@item_display).to be_valid
    end
  end
  context '出品できない時' do
    it '商品名が空だと登録できない' do
      @item_display.item_name = ''
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Item name can't be blank")
    end
    it '商品の説明が空だと登録できない' do
      @item_display.item_explain = ''
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Item explain can't be blank")
    end
    it '配送料の負担についての情報が空だと登録できない' do
      @item_display.ship_burden_id = ''
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Ship burden can't be blank", "Ship burden is not a number")
    end
    it '配送料の負担についての情報が未選択("--")だと登録できない' do
      @item_display.ship_burden_id = 1
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Ship burden must be other than 1")
    end
    it '発送元の地域についての情報が空だと登録できない' do
      @item_display.ship_source_id = ''
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Ship source can't be blank", "Ship source is not a number")
    end
    it '発送元の地域についての情報が未選択("--")だと登録できない' do
      @item_display.ship_source_id = 0
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Ship source must be other than 0")
    end
    it '発送までの日数についての情報が空だと登録できない' do
      @item_display.ship_date_id = ''
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Ship date can't be blank", "Ship date is not a number")
    end
    it '発送までの日数についての情報が未選択("--")だと登録できない' do
      @item_display.ship_date_id = 1
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Ship date must be other than 1")
    end
    it '販売価格についての情報が空だと登録できない' do
      @item_display.item_price = ''
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Item price can't be blank", "Item price is not a number", "Item price is not included in the list")
    end
    it '販売価格が300円未満だと登録できない' do
      @item_display.item_price = 299
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Item price is not included in the list")
    end
    it '販売価格が10,000,000円以上と登録できない' do
      @item_display.item_price = 10000000
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Item price is not included in the list")
    end
    it '販売価格が半角数字で入力しないと登録できない' do
      @item_display.item_price = "aaa"
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Item price is not a number", "Item price is not included in the list")
    end
    it '販売価格が全角文字では登録できない' do
      @item_display.item_price = "価格"
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Item price is not a number", "Item price is not included in the list")
    end
    it '販売価格が半角英数混合では登録できない' do
      @item_display.item_price = "123abc"
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Item price is not a number", "Item price is not included in the list")
    end
    it '販売価格が半角英語だけでは登録できない' do
      @item_display.item_price = "price"
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Item price is not a number", "Item price is not included in the list")
    end
    it 'カテゴリーについての情報が空だと登録できない' do
      @item_display.category_id = ""
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end
    it 'カテゴリーについての情報が未選択("--")だと登録できない' do
      @item_display.category_id = 1
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品の状態についての情報が空だと登録できない' do
      @item_display.status_id = ""
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Status can't be blank", "Status is not a number")
    end
    it '商品の状態についての情報が未選択("--")だと登録できない' do
      @item_display.status_id = 1
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Status must be other than 1")
    end
    it 'userが紐付いていないと登録できない' do
      @item_display.user = nil
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("User must exist")
    end
    it '画像が空だと登録できない' do
      @item_display.image = nil
      @item_display.valid?
      expect(@item_display.errors.full_messages).to include("Image can't be blank")
    end
  end
 end  
end
