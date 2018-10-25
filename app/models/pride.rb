class Pride < ApplicationRecord
  belongs_to :shop
  mount_uploader :image, ShopImageUploader
end
