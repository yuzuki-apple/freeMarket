class Item < ApplicationRecord
  validates :user_id,:name,:price,:description,:condition,:shipment_fee,:shipment_region,:shipment_schedule,presence: true
  validates :name, presence: true, length: { maximum: 40 }
  # validates :price, {greater_than_or_equal_to: 9999999,less_than_or_equal_to: 300}
  validates :description, presence: true, length: { maximum: 1000 }
  validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'
end
