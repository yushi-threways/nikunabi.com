class Address < ApplicationRecord
  belongs_to :shop, inverse_of: :address, optional: true
end
