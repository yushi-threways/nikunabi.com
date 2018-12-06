class ShopFeature < ApplicationRecord
  belongs_to :shop, optional: true
  belongs_to :feature, optional: true
end
