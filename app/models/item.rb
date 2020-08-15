class Item < ApplicationRecord

  belongs_to :user, optional: true 
  has_many :comments
  belongs_to :category
  has_many :images
  belongs_to :status
  belongs_to :postage_type
  belongs_to :prefecture
  belongs_to :need_day

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
