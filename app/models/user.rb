class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,:email,:encrypted_password,:family_name_kanji,:first_name_kanji,:family_name_kana,:first_name_kana,:birthday,presence: true
  validates :email, uniqueness:{case_sensitive:false},format:{with: /[\w\-._]+@[\w\-._]+\.[a-zA-Z]+/}
  validates :encrypted_password,:password,:password_confirmation,length:{minimum:7},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
  validates :family_name_kanji,:first_name_kanji,format:{with:/[^\x01-\x7E]+/}
  validates :family_name_kana,:first_name_kana,format:{with:/[ぁ-ん]+/}
  validates :birthday,format:{with:/\d{4}\-\d{2}\-\d{2}/}
  has_one :address
end