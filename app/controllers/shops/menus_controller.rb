class Shops::MenusController < Shops::ApplicationController
  before_action :set_menu, only: [:edit, :update, :destroy]
  layout "users", only: [:index, :show, :edit, :new]


  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all
  end

  # GET /menus
  # GET /menus
  def show
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
    @menu = Menu.new
    @menu = current_shop.menus.build(menu_params)
    respond_to do |format|
    if @menu.save
      format.html { redirect_to [:shops, @menu], notice: "メニュー#{ @menu.name }を作成しました。" }
      format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to [:shops, @menu], notice: "メニュー#{ @menu.name }を更新しました。" }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  #def destroy
  #  @menu.destroy
  #  respond_to do |format|
  #    format.html { redirect_to action: 'show', notice: 'Menu was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  #end
  def destroy
    @menu.destroy
    flash.notice = "メニュー(#{ menu.name })を削除しました。"
    redirect_to :shops_menus
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:name, :image, :price, :quantity, :bake, :taste, :comment)
    end

end
