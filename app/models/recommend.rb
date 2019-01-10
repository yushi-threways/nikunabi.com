class Recommend < ApplicationRecord
  has_many :shop_recommends, dependent: :destroy
  has_many :shops, through: :shop_recommends, dependent: :destroy
end
