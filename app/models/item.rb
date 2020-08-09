class Item < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :categories, through: :items_categories
  has_many :items_categories
  has_many :images
  belongs_to :status
  belongs_to :postage_type
  belongs_to :prefecture
  belongs_to :need_day
  belongs_to :sending_destination

  # userとのアソシエーション
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true 

  validates :name, presence: true, length:{maximum: 40}
  validates :price, presence: true, numericality:{greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :introduction, presence: true, length:{maximum: 1000}

  # imagesテーブルへのバリデーション（画像の空の保存を許可しないバリデーション）（三輪）
  validates_associated :images
  validates :images, presence: true

  accepts_nested_attributes_for :images, allow_destroy: true  
end
