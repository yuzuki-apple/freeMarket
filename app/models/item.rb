class Item < ApplicationRecord
  validates :user_id,:name,:price,:description,:category,:condition,:shipment_fee,:shipment_region,:shipment_schedule,presence: true
  validates :name, presence: true, length: { maximum: 40 }, message: "商品名を入力してください"
  # validates :price, {greater_than_or_equal_to: 9999999,less_than_or_equal_to: 300}
  validates :description, presence: true, length: { maximum: 1000 }, message: "商品の説明を入力してください"
  validates :category, message: "商品のカテゴリーを選択してください"
  validates :condition, presence: true, message: "商品の状態を選択してください"
  validates :shipment_fee, message: "配送料の負担を選択をしてください"
  validates :shipment_region, message: "発送元の地域を選択してください"
  validates :shipment_schedule, message: "発送までの日数を選択してください"
  validates_inclusion_of :price, in: 300..9_999_999, message: "300以上9999999以下で入力してください"
