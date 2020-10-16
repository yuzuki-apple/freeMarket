require 'rails_helper'
describe Item do

  before do
    @user = create(:user)
    @item = build(:item, user_id: @user.id)
  end

  describe "商品を出品する" do
    context '出品がうまくいくとき' do
      it "必須項目（すべて）があれば登録できる" do
        expect(@item).to be_valid
      end
      it "userがあれば登録できる" do
        # @item.user_id ="1"
        @item.user = build(:user)
        expect(@item).to be_valid
      end
      it "商品名があれば登録できる" do
        @item.name ="本"
        expect(@item).to be_valid
      end
      it "商品の説明があれば登録できる" do
        @item.description ="参考書になります"
        expect(@item).to be_valid
      end
      it "カテゴリーを選択すれば登録できる" do
        @item.category = build(:category)
        expect(@item).to be_valid
      end
      it "商品の状態を選択すれば登録できる" do
        @item.condition ="1"
        expect(@item).to be_valid
      end
      it "配送料の負担を選択すれば登録できる" do
        @item.shipment_fee_id ="1"
        expect(@item).to be_valid
      end
      it "発送元の地域を選択すれば登録できる" do
        @item.shipment_region_id ="1"
        expect(@item).to be_valid
      end
      it "発送までの日数を選択すれば登録できる" do
        @item.shipment_schedule_id ="1"
        expect(@item).to be_valid
      end
      it "価格を入力すれば登録できる" do
        @item.price ="600"
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it "出品画像が無いと登録できない" do
        @item.images.clear
        @item.valid?
        expect(@item.errors.full_messages).to include("出品画像を入力してください")
      end
      it "商品名が無いと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "商品の説明が無いと登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it "カテゴリーを選択していないと登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors[:category]).to include("を入力してください")
      end
      it "商品の状態を選択していないと登録できない" do
        @item.condition = '１'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態：「選択してください」以外を選択してください")
      end
      it "配送料の負担を選択していないと登録できない" do
        @item.shipment_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担：「選択してください」以外を選択してください")
      end
      it "発送元の地域を選択していないと登録できない" do
        @item.shipment_region_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment region「選択してください」以外を選択してください")
      end
      it "発送までの日数を選択していないと登録できない" do
        @item.shipment_schedule_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment schedule「選択してください」以外を選択してください")
      end
      it "販売価格は300円以上で無いと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格：300〜9,999,999円以内で入力してください")
      end
      it "販売価格は10'000'000円未満で無いと登録できない" do
        @item.price = 10000001
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格：300〜9,999,999円以内で入力してください")
      end
    end
  end

end