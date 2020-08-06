class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # userが買った商品のアソシエーション（userと紐づいた時にコメントアウト外す）（三輪）
  # has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  # userが現在売っている商品のアソシエーション
  # has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
  # userが既に売った商品のアソシエーション
  # has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"
end
