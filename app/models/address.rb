class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :family_name_kanji,:first_name_kanji,:family_name_kana,:first_name_kana,:post_number,:prefecture,:city,:block_number,presence:true
  validates :family_name_kanji,:first_name_kanji,format:{with:/[^\x01-\x7E]+/}
  validates :family_name_kana,:first_name_kana,format:{with:/[ぁ-ん]+/}
end
