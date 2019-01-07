class ShopEvent < ApplicationRecord
  belongs_to :shop, optional: true

  mount_uploader :image, ShopImageUploader

  validates :title, presence: true, length: {minimum:3, maximum:50}
  validates :content, presence: true

  def not_before_today
    errors.add(:published_at, "公開日は#{ Date.today.strftime('%Y年%m月%d日') }よりも後の日に設定してください。") if published_at.nil? || published_at < Date.today
  end
end
