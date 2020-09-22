class Item < ApplicationRecord
  validates :user_id,:name,:price,:description,:category,:condition,:shipment_fee,:shipment_region,:shipment_schedule,presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category, presence: true
  validates :condition, presence: true
  validates :shipment_fee, presence: true
  validates :shipment_region, presence: true
  validates :shipment_schedule, presence: true
  validates_inclusion_of :price, in: 300..9_999_999, message: "300以上9999999以下で入力してください"

  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
end