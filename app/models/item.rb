class Item < ApplicationRecord
  validates :user_id,:images,:name,:description,:category,:condition,:shipment_fee_id,:shipment_region,:shipment_schedule,:stock,presence: true
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :category, numericality:{other_than: 0, message: "「選択してください」以外を選択してください"}
  validates :condition, numericality:{other_than: 0, message: "「選択してください」以外を選択してください"}
  validates :shipment_region, numericality:{other_than: 0, message: "「選択してください」以外を選択してください"}
  validates :shipment_schedule, numericality:{other_than: 0, message: "「選択してください」以外を選択してください"}
  validates :stock, numericality:{only_integer: true,greater_than_or_equal_to: 0,less_than_or_equal_to: 9999}
  validates :price, numericality:{greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "300〜9,999,999円以内で入力してください"}

  belongs_to  :user
  has_many    :payments, dependent: :destroy
  has_many    :images
  accepts_nested_attributes_for :images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to  :shipment_fee
end
