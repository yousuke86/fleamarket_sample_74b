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
|last_name_japanese|string|null:false|
|first_name_japanese|string|null:false|
|birthday|integer|null:false|
<!-- |comment|integer|null:false , foreign_key:true| -->

### Association

- has_many : addresses
- has_many : cards
- has_many : commments
- has_many : items

## addresses テーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null:false|
|prefecture|integer|null:false , foreign_key:tue|
|municipalities|string|null:false|
|house_number|string|null:false|
|buildingname_and_roomnumber|string|
|tel|integer|
|user_id|integer|null:false , foreign_key:true|

### Association

- belongs_to : user
- belongs_to : prefecture


### cards テーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false , foreign_key:true|
|customer_id|string|null:false , unique:true|
|card_id|string|null:false , unique:true|

### Association

- belongs_to : user


### comments テーブル

|Column|Type|Options|
|------|----|-------|
|text｜text｜
|user_id|integer|null:false , foreign_key:true|

### Association

- belongs_to : user
- belongs_to : item

## items テーブル

|Column|Type|Options|
|------|----|-------|
｜name|string|null:false|
|price|integer|null:false|
|text|text|null:false|
|image_id|integer|null:false|
<!-- |comment_id|integer|null:false , foreign_key:true| -->
|brand_id|integer|null:false , foreign_key:true|
|status|integer|null:false , foreign_key:true|
|burden_id|integer|null:false , foreign_key:true|
|prefecture_id|null:false , foreign_key:true|
|days_id|null:false , foreign_key:true|
|user_id|null:false , foreign_key:true|

### Association

- belongs_to : user
- has_many : comments
- has_many : categories, through : items-categories
- has_many : item-categories
- has_many : images
- belongs_to : brand
- belongs_to : status
- belongs_to : burden
- belongs_to : prefecture
- belongs_to : days


## items-categories 中間テーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null:false , foreign_key|
|categories|integer|null:false , foreign_key:true|


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
|image|string|null:false|
|item_id|integer|null:false , foreign_key:true|


### Association

- belongs_to : items


## brands テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|item_id|integer|null:false , foreign_key:true|


### Association

- has_many : items


## statuses テーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null:false|
|item_id|imteger|null:false , foreign_key:true|


### Association

- belongs_to : items


## burdens テーブル
|Column|Type|Options|
|------|----|-------|
|burden|string|null:false|
|item_id|integer|null:false , foreign_key|


### Association 

- has_many : items


## prefectures テーブル
|Column|Type|Options|
|------|----|-------|
|prefecture|string|null:false|
|item_id|integer|null:false , foreign_key:true|


### Association

- has_many : users
- has_many : items


## days テーブル

|Column|Type|Options|
|------|----|-------|
|days|string|null:false|
|item_id|integer|null:false , foreign_key:true|


### Association

- has_many : items