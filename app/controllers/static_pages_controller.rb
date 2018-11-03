class StaticPagesController < ApplicationController
  def home
    @newShops = Shop.limit(5).includes([:address, :details, :city, :recommends, :features]).order(created_at: :desc)
    @firstblog = Blog.order(created_at: :desc).first
    @homeblogs = Blog.where.not(id: 1).limit(3)
    @newinformations = Blog.order(created_at: :desc).limit(5)
  end

  def help

  end

  def about

  end

  private


end
