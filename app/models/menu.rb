class Menu < ApplicationRecord
  belongs_to :shop
  mount_uploader :image, ShopImageUploader

  validate :check_number_of_menus

  def check_number_of_menus
  if shop && shop.menus.count > 10
   errors.add(:shop, "１０個以上メニューの登録はできません。")
  end
 end
end
