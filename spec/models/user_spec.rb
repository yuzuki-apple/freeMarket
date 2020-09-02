require 'rails_helper'
describe User do
  describe '#create' do

    it "必須項目（すべて）があれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "ニックネームが無いと登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "メールアドレスが無いと登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "メールアドレスは一意でないと登録できない" do
      another_user = create(:user)
      user = build(:user, email: another_user.email)
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end

    it "メールアドレスは@とドメインが無ければ登録できない" do
      user = build(:user, email: "aaaaaaaaaaa")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "メールアドレスは@とドメインを含めば登録できる" do
      user = build(:user, email: "aaaaaa@aa.aaa")
      expect(user).to be_valid
    end

    it "メールアドレスはドメインが無ければ登録できない" do
      user = build(:user, email: "aaaaa@aaaaaa")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "メールアドレスは@がが無ければ登録できない" do
      user = build(:user, email: "aaaaa.aaaaaa")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "パスワードが半角英数のみ７文字以上で登録できる" do
      user = build(:user, password: "aaaaaa7", password_confirmation: "aaaaaa7")
      expect(user).to be_valid
    end

    it "パスワードが無いと登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "パスワード確認用が無いと登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "パスワードが半角英数のみ７文字以上であっても確認用と異なれば登録できない" do
      user = build(:user, password: "000000a", password_confirmation: "000000b")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "パスワードが6文字以下では登録できない" do
      user = build(:user, password: "1111d1", password_confirmation: "1111d1")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "パスワードが数字のみでは登録できない" do
      user = build(:user, password: "11111111111", password_confirmation: "11111111111")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end

    it "パスワードが文字のみでは登録できない" do
      user = build(:user, password: "aaaaaaaaaaa", password_confirmation: "aaaaaaaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end

    it "パスワードが半角英数以外の文字を含む" do
      user = build(:user, password: "1111-ssssss", password_confirmation: "1111-ssssss")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end

    it "ユーザー名字が無いと登録できない" do
      user = build(:user, family_name_kanji: nil)
      user.valid?
      expect(user.errors[:family_name_kanji]).to include("を入力してください")
    end

    it "ユーザー名前が無いと登録できない" do
      user = build(:user, first_name_kanji: nil)
      user.valid?
      expect(user.errors[:first_name_kanji]).to include("を入力してください")
    end

    it "ユーザー名字かなが無いと登録できない" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "ユーザー名前かなが無いと登録できない" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "ユーザー名字かながひらがなでないと登録できない" do
      user = build(:user, family_name_kana: "山田")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end

    it "ユーザー名前かながひらがなでないと登録できない" do
      user = build(:user, first_name_kana: "太郎")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "ユーザー本名は全角でないと登録できない" do
      user = build(:user, email: "ﾔﾏﾀﾞ")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "ユーザー本名のふりがなは全角でないと登録できない" do
      user = build(:user, email: "ﾀﾛｳ")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "生年月日が無いと登録できない" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

    it "生年月日が4-2-2桁で登録できる" do
      user = build(:user, birthday: "1975-01-01")
      expect(user).to be_valid
    end

  end
end