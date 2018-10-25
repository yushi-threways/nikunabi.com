class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def index
    @search_cities = City.all
    @search_recommends = Recommend.all
    @search_features = Feature.all
    @q = Shop.ransack(params[:q])
    @shops = @q.result.includes(:city, :address, :details, :recommends, :features)
  end

  def search
    @q = Shop.search(search_params)
    @shops = @q.result.includes(:city, :address, :details, :recommends, :features)
  end

  def show
    @shop = set_shop
  end

  # GET /shops/new
  def new
  end

  # GET /shops/1/edit
  def edit
  end

  def create
    @shop = Shop.new(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: '基本情報を登録しました.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @shop = set_shop

    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to controller: 'shops', action: 'show', notice: "基本情報を編集しました"}
      else
        format.html { render :edit }
      end
    end
  end


private

  def shop_params
  params.require(:shop).permit()
  end

  def set_shop
    Shop.find(params[:id])
  end

end
