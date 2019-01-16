class Admins::ShopEventsController < Admins::ApplicationController
  before_action :set_shop_event, only: [:show, :edit, :update, :destroy]
  layout "admins", only: [:index, :show, :edit, :new]

  # GET /shop_events
  # GET /shop_events.json
  def index
    @shop_events = ShopEvent.all
  end

  # GET /shop_events/1
  # GET /shop_events/1.json
  def show
  end

  # GET /shop_events/new
  def new
    @shop_event = ShopEvent.new
  end

  
  # POST /shop_events
  # POST /shop_events.json
  def create
    @shop_event = ShopEvent.new(shop_event_params)

    respond_to do |format|
      if @shop_event.save
        format.html { redirect_to :admins_shop_events, notice: 'イベントを作成しました。' }
        format.json { render :show, status: :created, location: @shop_event }
      else
        format.html { render :new }
        format.json { render json: @shop_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shop_events/1
  # PATCH/PUT /shop_events/1.json
  def update
    respond_to do |format|
      if @shop_event.update(shop_event_params)
        format.html { redirect_to :admins_shop_events, notice: 'イベントを更新しました。' }
        format.json { render :show, status: :ok, location: [:admins, @shop_event] }
      else
        format.html { render :edit }
        format.json { render json: @shop_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def published_edit
    respond_to do |format|
      if @shop_event.update_columns(:published)
        format.html { redirect_to :admins_shop_events, notice: '公開状況を変更しました。' }
        format.json { render :show, status: :ok, location: [:admins, @shop_event] }
      else
        format.html { render :edit }
        format.json { render json: @shop_event.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /shop_events/1
  # DELETE /shop_events/1.json
  def destroy
    @shop_event.destroy
    respond_to do |format|
      format.html { redirect_to [:admins, admins_shop_events_url], notice: 'イベントを削除しましt。' }
      format.json { head :no_content }
    end
  end
 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_event
      @shop_event = ShopEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_event_params
      params.require(:shop_event).permit(:title, :content, :image, :published, :closed_at, :published_at, :image_cache, :remove_image)
    end
end
