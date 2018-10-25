class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :blogs, inverse_of: :admin, dependent: :destroy
  accepts_nested_attributes_for :blogs, allow_destroy: true
  has_many :informations, inverse_of: :admin, dependent: :destroy
  accepts_nested_attributes_for :informations, allow_destroy: true
end
