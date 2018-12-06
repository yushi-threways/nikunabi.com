class DetailRoom < ApplicationRecord
  belongs_to :detail, optional: true
  belongs_to :room, optional: true
end
