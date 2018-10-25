class City < ApplicationRecord
  has_many :shops, :class_name => 'Shop', dependent: :destroy

end
