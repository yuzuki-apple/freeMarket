class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,:email,:encrypted_password,:family_name_kanji,:first_name_kanji,:family_name_kana,:first_name_kana,:birthday,presence: true
  validates :email, uniqueness:{case_sensitive:false},format:{with: /[\w\-._]+@[\w\-._]+\.[a-zA-Z]+/}
  validates :encrypted_password,length:{minimum:7},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
  validates :family_name_kanji,:first_name_kanji,format:{with:/[^\x01-\x7E]+/}
  validates :family_name_kana,:first_name_kana,format:{with:/[ぁ-ん]+/}
  has_one :address
end