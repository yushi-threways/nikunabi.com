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
  end

  def help

  end

  def about
  end

  def agreement
  end

  private


end
