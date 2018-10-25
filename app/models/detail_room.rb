class DetailRoom < ApplicationRecord
  belongs_to :detail
  belongs_to :room
end
