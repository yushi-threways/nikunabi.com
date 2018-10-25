class Mypages::ShopsController < Mypages::ApplicationController
  before_action :set_shop
  before_action :authenticate_shop!, only: [:show, :edit, :update]
  layout "users", only: [:show, :edit, :update]


  def show

  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
    @shop = set_shop
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

  def set_address
    @address = Address.where(:id => params[:shop_id]).first
  end

  def set_detail
    @detail = Detail.where(:id => params[:shop_id]).first
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    #@user = User.find(params[:id])
    @user = User.where(:id => params[:user_id]).first
  end
end
