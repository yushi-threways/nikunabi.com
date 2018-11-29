class Admins::InformationsController < Admins::ApplicationController
  before_action :set_information, only: [:show, :edit, :update, :destroy]
  layout "admins"

  # GET /information
  # GET /information.json
  def index
    @informations = Information.all
  end

  # GET /information/new
  def new
    @information = Information.new
  end

  # GET /information/1/edit
  def edit
  end

  # POST /information
  # POST /information.json
  def create
    @information = current_admin.informations.build(information_params)
    respond_to do |format|
      if @information.save
        format.html { redirect_to :admins_root, notice: '新着情報を登録しました。' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /information/1
  # PATCH/PUT /information/1.json
  def update
    respond_to do |format|
      if @information.update(information_params)
        format.html { redirect_to :admins_root, notice: '新着情報を編集しました。' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /information/1
  # DELETE /information/1.json
  def destroy
    @information.destroy
    respond_to do |format|
      format.html { redirect_to @information, notice: '新着情報を削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information
      @information = Information.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def information_params
      params.require(:information).permit(:title, :content)
    end
end
