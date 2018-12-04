class Shops::MypagesController < Shops::ApplicationController
  layout "users", only: [:index, :show, :edit, :update]

  def index
    @shop = current_shop    
  end

  def show

  end

  # GET /shops/new
  # def new
  #   @shop = Shop.new
  # end

  # def create
  #   @shop = Shop.new(shop_params)
  #   respond_to do |format|
  #     if @shop.save
  #       format.html { redirect_to @shop, notice: '基本情報を登録しました.' }
  #       format.json { render :show, status: :created, location: @address }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @shop.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def update
  #   respond_to do |format|
  #     if @shop.update(shop_params)
  #       format.html { redirect_to controller: 'shops', action: 'show', notice: "基本情報を編集しました"}
  #     else
  #       format.html { render :edit }
  #     end
  #   end
  # end


  private

  def shop_params
  params.require(:shop).permit()
  end
end
