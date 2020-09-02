require 'rails_helper'
describe Address do
  describe '#create' do

    it "ユーザー名字が無いと登録できない" do
      address = build(:address, family_name_kanji: nil)
      address.valid?
      expect(address.errors[:family_name_kanji]).to include("を入力してください")
    end

    it "ユーザー名前が無いと登録できない" do
      address = build(:address, first_name_kanji: nil)
      address.valid?
      expect(address.errors[:first_name_kanji]).to include("を入力してください")
    end

    it "ユーザー名字かなが無いと登録できない" do
      address = build(:address, family_name_kana: nil)
      address.valid?
      expect(address.errors[:family_name_kana]).to include("を入力してください")
    end

    it "ユーザー名前かなが無いと登録できない" do
      address = build(:address, first_name_kana: nil)
      address.valid?
      expect(address.errors[:first_name_kana]).to include("を入力してください")
    end

    it "郵便番号が無いと登録できない" do
      address = build(:address, post_number: nil)
      address.valid?
      expect(address.errors[:post_number]).to include("を入力してください")
    end

    it "郵便番号は半角数字3桁-4桁で登録できる" do
      address = build(:address, post_number: "123-1234")
      expect(address).to be_valid
    end

    it "郵便番号は半角数字で無いと登録できない" do
      address = build(:address, post_number: "あ12-1234")
      address.valid?
      expect(address.errors[:post_number]).to include("は不正な値です")
    end

    it "郵便番号は3桁-4桁で無いと登録できない" do
      address = build(:address, post_number: "1121-234")
      address.valid?
      expect(address.errors[:post_number]).to include("は不正な値です")
    end

    it "都道府県が無いと登録できない" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください")
    end

    it "市区町村が無いと登録できない" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "番地が無いと登録できない" do
      address = build(:address, block_number: nil)
      address.valid?
      expect(address.errors[:block_number]).to include("を入力してください")
    end

    it "マンション名やビル名、そしてその部屋番号は任意" do
      address = build(:address, apartment_name: nil)
      expect(address).to be_valid
    end

    it "お届け先の電話番号は任意" do
      address = build(:address, phone_number: nil)
      expect(address).to be_valid
    end

    it "お届け先の電話番号は10桁で登録できる" do
      address = build(:address, phone_number: "0612341234")
      expect(address).to be_valid
    end

    it "お届け先の電話番号は11桁で登録できる" do
      address = build(:address, phone_number: "09012341234")
      expect(address).to be_valid
    end

    it "お届け先の電話番号は9桁で登録できない" do
      address = build(:address, phone_number: "123456789")
      expect(address).to be_valid
    end

  end
end