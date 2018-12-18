class Blog < ApplicationRecord
    belongs_to :admin
    mount_uploader :image, ShopImageUploader
end
