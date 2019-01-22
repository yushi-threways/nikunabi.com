class ShopEvent < ApplicationRecord
  belongs_to :shop, optional: true

  mount_uploader :image, ShopImageUploader

  validates :title, presence: true, length: {minimum:3, maximum:50}
  validates :content, presence: true
  validates :closed_at, presence: true
  validates :published_at, presence: true
  validate :not_before_today
  validate :date_end_check

  def not_before_today
   errors.add(:published_at, "公開日は#{ Date.today.strftime('%Y年%m月%d日') }よりも後の日に設定してください。") if published_at.nil? || published_at < Date.today
  end

  def date_end_check
    errors.add(:closed_at, "の日付を正しく記入してください。") unless
    self.published_at < self.closed_at
  end
end
