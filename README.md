# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|reset_password_token|string|unique: true|
|reset_password_sent_at|datetime||
|remember_created_at|datetime||

### Association
- has_many :items
- has_one :address
- has_one :card


## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|post_number|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|block_number|string|null: false|
|apartment_name|string||
|phone_number|string||

### Association
- belongs_to :user
- belongs_to :prefecture


## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|name|string|null: false|
|price|integer|null: false|
|description|string|null: false|
|brand|string||
|condition_id|integer|null: false|
|shipment_fee_id|integer|null: false|
|shipment_region_id|integer|null: false|
|shipment_schedule_id|integer|null: false|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :buyer
- has_many :images


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||
|ancestry|string||

### Association
- has_many :items


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|src|string|null: false|

### Association
- belongs_to :item

