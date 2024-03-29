class Shops::DetailsController < Shops::ApplicationController
  before_action :set_detail, only: [:show, :edit, :update, :destroy]
  layout "users", only: [:index, :show, :edit, :new]

  # GET /details
  # GET /details.json
  def index
    @details = Detail.all
  end

  # GET /details/1
  # GET /details/1.json
  def show
    @shop = @detail.shop
  end

  # GET /details/new
  def new
    @detail = Detail.new
  end

  # GET /details/1/edit
  def edit
  end

  # POST /details
  # POST /details.json
  def create
    @detail = Detail.new(detail_params)
    respond_to do |format|
      if @detail.save
        format.html { redirect_to [:shops, @detail], notice: '店舗詳細情報を作成しました。' }
        format.json { render :show, status: :created, location: @detail }
      else
        format.html { render :new }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /details/1
  # PATCH/PUT /details/1.json
  def update
    respond_to do |format|
      if @detail.update(detail_params)
        format.html { redirect_to [:shops, @detail], notice: '店舗詳細情報を更新しました。' }
        format.json { render :show, status: :ok, location: @detail }
      else
        format.html { render :edit }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /details/1
  # DELETE /details/1.json
  def destroy
    @detail.destroy
    respond_to do |format|
      format.html { redirect_to details_url, notice: 'Detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail
      @detail = Detail.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def detail_params
      params.require(:detail).permit(:shop_id, :image, :open, :holiday, :access, :parking, :payment, :smoking, :facility, :light, :vibe, :party, :concept, :account, :seat, :table, {:room_ids => []}, {:scene_ids => []})
    end
end
