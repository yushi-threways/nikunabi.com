class Address < ApplicationRecord
  before_validation :create_full_address
  geocoded_by :full_address
  before_save :geocode, if: :full_address_changed?

  belongs_to :shop, optional: true
  belongs_to :city
  belongs_to :area

  validates :zipcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture, presence: true
  validates :street, presence: true
  validates :station, presence: true

  def create_full_address
    full_address = [prefecture, self.city.city, street]
    self.full_address = full_address.join
  end
end