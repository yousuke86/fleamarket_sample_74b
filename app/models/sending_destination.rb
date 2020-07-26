class SendingDestination < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture, optional: true
  validates :destination_last_name, presence: true
  validates :destination_first_name, presence: true
  validates :destination_last_name_kana, presence: true
  validates :destination_first_name_kana, presence: true
  validates :post_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
end
