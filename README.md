# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## userテーブル
|Column|Type|Options|
|------|----|-------|
|id                             |string|null: false|
|delivery_information_id        |string|null: false , foreign_key: true|
|credit_card_id                 |string|null: false , foreign_key: true|
|nickname                       |string|null: false , foreign_key: true|
|email                          |text|null: false , unique: true|
|password                       |text|null: false , unique: true|
|first_name                     |text|null: false|
|family_name                    |text|null: false|
|first_name_furigana            |text|null: false|
|family_name_furigana           |text|null: false|
|year_id                        |string|null: false , foreign_key: true|
|month_id                       |string|null: false , foreign_key: true|
|date_id                        |string|null: false , foreign_key: true|
### Association
- has_many :item
- has_many :delivery_information
- has_many :credit_card
- has_many :year_id
- has_many :month_id
- has_many :date_id


## delivery_informationテーブル
|Column|Type|Options|
|------|----|-------|
|id                             |string|null: false|
|user_id                        |string|null: false , foreign_key: true|
|prefecture_id                  |string|null: false , foreign_key: true|
|delivery_family_name           |text|null: false|
|delivery_first_name            |text|null: false|
|delivery_family_name_furigana  |text|null: false|
|delivery_first_name_furigana   |text|null: false|
|Postal_code                    |string|null: false|
|city                           |text|null: false|
|address                        |text|null: false|
|building_room_number           |text||
|phone_number                   |text||
### Association
- belongs_to :user
- belongs_to :prefecture_id


## credit_cardテーブル
|Column|Type|Options|
|------|----|-------|
|id                             |string|null: false|
|user_id                        |string|null: false , foreign_key: true|
|credit_card_holder             |text|null: false|
|card_number                    |string|null: false|
|year_id                        |string|null: false , foreign_key: true|
|month_id                       |string|null: false , foreign_key: true|
|security_code                  |string|null: false|
### Association
- belongs_to :user
- has_many :year
- has_many :month


## itemテーブル
|Column|Type|Options|
|------|----|-------|
|id                             |string|null: false|
|seller_id                      |string|null: false , foreign_key: true|
|buyer_id                       |string|null: false , foreign_key: true|
|image_id                       |string|null: false , foreign_key: true|
|categories_id                  |string|null: false , foreign_key: true|
|size_id                        |string|foreign_key: true|
|prefecture_id                  |string|null: false , foreign_key: true|
|condition_id                   |string|null: false , foreign_key: true|
|shipping_fee_id                |string|null: false , foreign_key: true|
|delivery_days_id               |string|null: false , foreign_key: true|
|name                           |text|null: false|
|price                          |string|null: false|
|description                    |text|null: false|
|brand_id                       |string|foreign_key: true|
### Association
- belongs_to :user_id
- has_many :image
- has_many :categories
- has_many :size
- has_many :prefecture
- has_many :condition
- has_many :shipping_fee
- has_many :delivery_days
- has_many :brand


## imageテーブル
|Column|Type|Options|
|------|----|-------|
|id                             |string|null: false|
|item_id                        |string|null: false , foreign_key: true|
|image_1                        |string||
|image_2                        |string||
|image_3                        |string||
|image_4                        |string||
|image_5                        |string||
|image_6                        |string||
|image_7                        |string||
|image_8                        |string||
|image_9                        |string||
|image_10                       |string||
### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|id                             |string|null: false|
|category_name                  |text|null: false|
|ancestry_path                  |string||
### Association
- belongs_to :item

## sizeテーブル
|Column|Type|Options|
|------|----|-------|
|id                             |string|null: false|
|size                           |text|null: false|
### Association
- belongs_to :item

## conditionテーブル
|Column|Type|Options|
|------|----|-------|
|id                             |string|null: false|
|condition                      |text|null: false|
### Association
- belongs_to :item

## shipping_feeテーブル
|Column|Type|Options|
|------|----|-------|
|id                             |string|null: false|
|shipping_fee                   |text|null: false|
### Association
- belongs_to :item


## delivery_daysテーブル
|Column|Type|Options|
|------|----|-------|
|id                             |string|null: false|
|delivery_days                  |text|null: false|
### Association
- belongs_to :item


## brandテーブル
|Column|Type|Options|
|------|----|-------|
|id                             |string|null: false|
|brand_name                     |text|null: false|
### Association
- belongs_to :item


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
