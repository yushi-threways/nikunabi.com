class Feature < ApplicationRecord
  has_many :shop_features, dependent: :destroy
  has_many :shops, through: :shop_features
end
