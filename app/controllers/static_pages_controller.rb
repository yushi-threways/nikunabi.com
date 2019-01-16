class StaticPagesController < ApplicationController
  def home
    # @newShop = Shop.where( 'id >= ?', rand(Shop.first.id..Shop.last.id) ).includes([:details, :recommends, :features, :addresses, :areas]).first
    @firstblog = Blog.order(created_at: :desc).first
    @homeblogs = Blog.where.not(id: 1).limit(3)
    @newinformations = Information.order(created_at: :desc).limit(2)
    @recommends = Recommend.all
    @features = Feature.all
    @areas = Area.all
    @address = Address.all
    @shop_events = ShopEvent.where(["published_at <= ? and closed_at >= ? and published = ?", Date.today, Date.today, true]).order(published_at: :ASC).limit(5)
  end

  def help

  end

  def about
  end

  def agreement
  end

  private

end
