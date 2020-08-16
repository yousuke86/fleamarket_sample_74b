class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :sending_destinations
  has_many :items
  has_many :cards
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # userが買った商品のアソシエーション
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  # userが現在売っている商品のアソシエーション
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
  # userが既に売った商品のアソシエーション
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"

  validates :nickname,presence: true, length: {maximum: 8}
  validates :last_name,presence: true
  validates :first_name,presence: true
  validates :last_name_kana,presence: true
  validates :first_name_kana,presence: true
  validates :birth_day, presence: true

end
