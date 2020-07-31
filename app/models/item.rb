class Item < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :categories, through: :items_categories
  has_many :items_categories
  has_many :images
  belongs_to :brand
  belongs_to :status
  belongs_to :postage_type
  belongs_to :prefecture, optional: true
  belongs_to :need_day

  validates :name, presence: true, length:{maxmum: 40}
  validates :price, presence: true, numericality:{greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :introduction, presence: true, length:{maxmum: 1000}
end
