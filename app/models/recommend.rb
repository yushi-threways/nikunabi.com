class Recommend < ApplicationRecord
  has_many :shop_recommends
  has_many :shops, through: :shop_recommends
end
