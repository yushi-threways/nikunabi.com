class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :update, :destroy]

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

  # allow users to update their accounts without passwords
  def update_without_current_password(params, *options)
    params.delete(:current_password)
 
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
 
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

end
