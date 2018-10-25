class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable, :confirmable
  belongs_to :city
  has_one :address, :class_name => 'Address', dependent: :destroy, inverse_of: :shop
  has_one :details, :class_name => 'Detail', dependent: :destroy
  has_many :menus, inverse_of: :shop, dependent: :destroy
  accepts_nested_attributes_for :menus, allow_destroy: true
  has_many :prides, inverse_of: :shop, dependent: :destroy
  accepts_nested_attributes_for :prides, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true
  has_many :shop_recommends
  has_many :recommends, through: :shop_recommends
  has_many :shop_features
  has_many :features, through: :shop_features
end
