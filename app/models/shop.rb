class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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
end
