class Detail < ApplicationRecord
  belongs_to :shop
  has_many :detail_scenes
  has_many :scenes, through: :detail_scenes
  has_many :detail_rooms
  has_many :rooms, through: :detail_rooms
  mount_uploader :image, ShopImageUploader
end
