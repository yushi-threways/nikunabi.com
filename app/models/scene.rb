class Scene < ApplicationRecord
  has_many :detail_scenes, dependent: :destroy
  has_many :details, through: :detail_scenes
end
