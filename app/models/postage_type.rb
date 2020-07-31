class PostageType < ApplicationRecord

  has_many :items

  validates :postage_type, presence: true

end
