class Feature < ApplicationRecord
  has_many :shop_features
  has_many :shops, through: :shop_features
end
