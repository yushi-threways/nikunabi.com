class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :agreement

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable, :confirmable
  has_many :addresses, dependent: :destroy
  has_many :areas, through: :addresses
  has_many :cities, through: :addresses
  accepts_nested_attributes_for :addresses, allow_destroy: true
  has_one :details, :class_name => 'Detail', dependent: :destroy
  has_many :menus, inverse_of: :shop, dependent: :destroy
  accepts_nested_attributes_for :menus, allow_destroy: true
  has_many :menu_books, inverse_of: :shop, dependent: :destroy
  accepts_nested_attributes_for :menu_books, allow_destroy: true
  has_many :prides, inverse_of: :shop, dependent: :destroy
  accepts_nested_attributes_for :prides, allow_destroy: true
  has_many :shop_recommends
  has_many :recommends, through: :shop_recommends
  has_many :shop_features
  has_many :features, through: :shop_features
  has_many :shop_events, dependent: :destroy


  validates_acceptance_of :agreement, allow_nil: false, on: :create
  validates :name, presence: true
  validates :description, presence: true
  validates :telNumber, presence: true, format: {with: /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/}
  validate :recommends_number

  def recommends_number
    errors.add(:recommends, ) if recommends.size < 0
    errors.add(:recommends, "は4個までです") if recommends.size > 4
  end
end
