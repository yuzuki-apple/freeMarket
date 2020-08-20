class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,:email,:encrypted_password,:family_name_kanji,:first_name_kanji,:family_name_kana,:first_name_kana,:birth_year,:birth_month,:birth_day,presence: true
  validates :email, uniqueness:{case_sensitive:false},format:{with: /[\w\-._]+@[\w\-._]+\.[a-zA-Z]+/}
  validates :encrypted_password,length:{minimum:7}
  validates :family_name_kanji,:first_name_kanji,format:{with:/[^\x01-\x7E]+/}
  validates :family_name_kana,:first_name_kana,format:{with:/[ァ-ヴ]+/}
end