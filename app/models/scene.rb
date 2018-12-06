class Scene < ApplicationRecord
  has_many :detail_scenes
  has_many :details, through: :detail_scenes
end
