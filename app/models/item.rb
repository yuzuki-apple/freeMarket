class Item < ApplicationRecord
  validates :user_id,:name,:description,:category,:condition,:shipment_fee,:shipment_region,:shipment_schedule,presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category, numericality:{other_than: 0, message: "「選択してください」以外を選択してください"}
  validates :condition, numericality:{other_than: 0, message: "「選択してください」以外を選択してください"}
  validates :shipment_fee, numericality:{other_than: 0, message: "「選択してください」以外を選択してください"}
  validates :shipment_region, numericality:{other_than: 0, message: "「選択してください」以外を選択してください"}
  validates :shipment_schedule, numericality:{other_than: 0, message: "「選択してください」以外を選択してください"}
  validates :price, numericality:{greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "300〜9,999,999円以内で入力してください"}

  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
end