class Room < ApplicationRecord
  has_many :detail_rooms
  has_many :details, through: :detail_rooms
end
