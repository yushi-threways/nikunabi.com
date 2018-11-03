class MenuBook < ApplicationRecord
    belongs_to :shop
    mount_uploader :images, ShopImageUploader
end
