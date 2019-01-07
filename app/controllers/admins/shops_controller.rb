class Admins::ShopsController < Admins::ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  layout "admins", only: [:index, :show, :edit, :new, :event]

  PER = 10

  def index
    @shops = Shop.includes(:addresses).page(params[:page]).per(PER)
  end

  def event
    @shops = Shop.includes(:shop_events).page(params[:page]).per(PER)
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
        format.html { redirect_to [:admins, @shop], notice: "#{@shop.name}の情報を作成しました。" }
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
        format.html { redirect_to [:admins, @shop], notice: "#{@shop.name}の情報を変更しました。"}
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
