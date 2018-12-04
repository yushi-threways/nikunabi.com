class City < ApplicationRecord
  has_many :addresses
  has_many :shops, through: :addresses
end
