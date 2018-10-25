class StaticPagesController < ApplicationController
  def home
    @newShops = Shop.limit(5).includes([:address, :details, :city, :recommends, :features]).order(created_at: :desc)
    @blogs = Blog.all
    @informations = Information.all
  end

  def help

  end

  def about

  end

  private


end
