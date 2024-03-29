class MenusController < ApplicationController
  before_action :set_menu, only: [:edit, :update, :destroy]
  before_action :authenticate_shop!	,only: [:show, :edit, :update, :destroy]
  layout "users", only: [:index, :show, :edit, :new]


  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all
  end

  # GET /menus
  # GET /menus
  def show
    @menus = Menu.all
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @shop = Shop.find(params[:shop_id])
    @menu = Menu.new(menu_params)
    @menu.shop = @shop

    if @menu.save
      redirect_to @menu, notice: "#{@shop.menus.size}件の商品を登録しました。"
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to action: 'show', notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:name, :image, :price)
    end

end
