
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


## users テーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|email|string|null:false , unique:true|
|password|string|null:false , unique:true| <!-- 7文字以上 -->
|last_name|string|null:false|
|first_name|string|null:false|
|last_name_kana|string|null:false|
|first_name_kana|string|null:false|
|birth_year|date|null:false|
|birth_month|date|null:false|
|birth_day|date|null:false|

### Association

- has_many : sending_destinations
- has_many : cards
- has_many : comments
- has_many : items

## sending_destinations テーブル

|Column|Type|Options|
|------|----|-------|
|destination_last_name|string|null:false|
|destination_first_name|string|null:false|
|destination_last_name_kana|string|null:false|
|destination_first_name_kana|string|null:false|
|post_code|integer|null:false|
|prefectures_id|references|null:false , foreign_key:true|
|city|string|null:false|
|house_number|string|null:false|
|buildingname_and_roomnumber|string||
|tel|integer||
|user_id|references|null:false , foreign_key:true|

### Association

- belongs_to : user
- belongs_to : prefecture


### cards テーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false , foreign_key:true|
|customer_id|string|null:false , unique:true|
|card_id|string|null:false , unique:true|

### Association

- belongs_to : user


### comments テーブル

|Column|Type|Options|
|------|----|-------|
|comment|text||
|user_id|references|null:false , foreign_key:true|
|item_id|references|null:false , foreign_key:true|

### Association

- belongs_to : user
- belongs_to : item

## items テーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|price|integer|null:false|
|introduction|text|null:false|
|brand_id|references|null:false , foreign_key:true|
|status_id|references|null:false , foreign_key:true|
|postage_type_id|references|null:false , foreign_key:true|
|prefecture_id|references|null:false , foreign_key:true|
|need_day_id|references|null:false , foreign_key:true|
|user_seller_id|references|null:false , foreign_key|
|user_buyer_id|references|null:false , foreign_key|


### Association

- belongs_to : user
- has_many : comments
- has_many : categories, through : items-categories
- has_many : items-categories
- has_many : images
- belongs_to : brand
- belongs_to : status
- belongs_to : postage_type
- belongs_to : prefecture
- belongs_to : need_day


## items-categories 中間テーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null:false , foreign_key:true|
|category_id|references|null:false , foreign_key:true|


### Association

- belongs_to : item
- belongs_to : category


## categories テーブル 

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|


### Association

- has_many : items , through : items-categories
- has_many : items-categories


## images テーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|null:false|
|item_id|references|null:false , foreign_key:true|


### Association

- belongs_to : item


## brands テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|



### Association

- has_many : items


## statuses テーブル (active_hash)
|Column|Type|Options|
|------|----|-------|
|status|string|null:false|



### Association

- has_many : items


## postage_types テーブル  (active_hash)
|Column|Type|Options|
|------|----|-------|
|postage_type|string|null:false|


### Association 

- has_many : items


## prefectures テーブル (active_hash)
|Column|Type|Options|
|------|----|-------|
|prefecture|string|null:false|



### Association

- has_many : users
- has_many : items


## need_days テーブル (active_hash)

|Column|Type|Options|
|------|----|-------|
|need_day|string|null:false



### Association

- has_many : items