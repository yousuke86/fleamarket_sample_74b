class Status < ApplicationRecord

  has_many :items

  validates :status, presence: true

end
