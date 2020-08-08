class NeedDay < ApplicationRecord

  has_many :items

  validates :need_day, presence: true

end
