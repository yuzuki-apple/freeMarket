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
|password|string|null: false, length: {minimum: 7}|
|password_confirm|string|null: false, length: {minimum: 7}|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|

### Association
- has_many :items,
- has_one :address
- has_one :creditcard


## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|post_number|interger|null: false|
|prefecture|strings|null: false|
|city|string|null: false|
|block_number|string|null: false|
|apartment_name|string||
|phone_number|integer||

### Association
- belongs_to :user


## creditcardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_number|interger|null: false|

### Association
- belongs_to :user


## items_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :category


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|name|string|null: false|
|price|int|null: false|
|description|text|null: false|
|brand|string||
|size|string||
|condition|string|null: false|
|shipment_fee|string|null: false|
|shipment_region|string|null: false|
|shipment_schedule|string|null: false|

### Association
- belongs_to :user
- has_many :categories, thorough: :items_categories
- has_many :items_categories
- has_many :images


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items, through: :items_categories
- has_many :items_categories


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image_url|string|null: false|

### Association
- belongs_to :item

