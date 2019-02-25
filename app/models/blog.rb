class Blog < ApplicationRecord
    belongs_to :admin
    has_many :blog_pictures
    accepts_nested_attributes_for :blog_pictures, allow_destroy: true
    mount_uploader :main_image, BlogImageUploader
    mount_uploader :image_01, BlogImageUploader
    mount_uploader :image_02, BlogImageUploader
    mount_uploader :image_03, BlogImageUploader
    mount_uploader :image_04, BlogImageUploader
end
