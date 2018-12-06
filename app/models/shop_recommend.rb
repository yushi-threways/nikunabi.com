class ShopRecommend < ApplicationRecord
  belongs_to :shop, optional: true
  belongs_to :recommend, optional: true
end
