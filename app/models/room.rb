class Room < ApplicationRecord
  has_many :detail_rooms, dependent: :destroy
  has_many :details, through: :detail_rooms
end
