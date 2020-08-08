class Prefecture < ApplicationRecord


  has_many :items
  # has_many :users

  validates :prefecture, presence: true


  has_many :sending_destinations

end
