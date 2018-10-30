class Mypages::PridesController < ApplicationController
  before_action :set_pride, only: [:edit, :update, :destroy]
  before_action :authenticate_shop!	,only: [:show, :edit, :update, :destroy]
  layout "users", only: [:index, :show, :edit, :new]

  # GET /prides
  # GET /prides.json
  def index
    @prides = Pride.all
  end

  # GET /prides/1
  # GET /prides/1.json
  def show
  end

  # GET /prides/new
  def new
    @pride = Pride.new
  end

  # GET /prides/1/edit
  def edit
  end

  # POST /prides
  # POST /prides.json
  def create
    @shop = Shop.find(params[:shop_id])
    @pride = Pride.new(pride_params)
    @pride.shop = @shop

    respond_to do |format|
      if @pride.save
        format.html { redirect_to [:mypages, @pride], notice: 'こだわり情報を作成しました。' }
        format.json { render :show, status: :created, location: @pride }
      else
        format.html { render :new }
        format.json { render json: @pride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prides/1
  # PATCH/PUT /prides/1.json
  def update
    respond_to do |format|
      if @pride.update(pride_params)
        format.html { redirect_to [:mypages, @pride], notice: 'こだわり情報を更新しました。' }
        format.json { render :show, status: :ok, location: @pride }
      else
        format.html { render :edit }
        format.json { render json: @pride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prides/1
  # DELETE /prides/1.json
  def destroy
    @pride.destroy
    respond_to do |format|
      format.html { redirect_to prides_url, notice: 'Pride was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pride
      @pride = Pride.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pride_params
      params.require(:pride).permit(:title, :image, :content)
    end
end
