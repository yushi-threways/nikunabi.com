class Blog < ApplicationRecord
    belongs_to :admin
    mount_uploader :image, ShopImageUploader
    mount_uploader :secondimage, ShopImageUploader
end
