class Area < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :shops, through: :addresses, dependent: :destroy
end
