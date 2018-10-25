class Mypages::RecommendsController < ApplicationController
  before_action :set_recommend, only: [:show, :edit, :update, :destroy]
  layout "users", only: [:index, :show, :edit, :new]

  # GET /recommends
  # GET /recommends.json
  def index
    @recommends = Recommend.all
  end

  # GET /recommends/1
  # GET /recommends/1.json
  def show
    @recommend = set_recommend
  end

  # GET /recommends/new
  def new
    @recommend = Recommend.new
  end

  # GET /recommends/1/edit
  def edit
  end

  # POST /recommends
  # POST /recommends.json
  def create
    @recommend = Recommend.new(recommend_params)

    respond_to do |format|
      if @recommend.save
        format.html { redirect_to @recommend, notice: 'Recommend was successfully created.' }
        format.json { render :show, status: :created, location: @recommend }
      else
        format.html { render :new }
        format.json { render json: @recommend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recommends/1
  # PATCH/PUT /recommends/1.json
  def update
    respond_to do |format|
      if @recommend.update(recommend_params)
        format.html { redirect_to @recommend, notice: 'Recommend was successfully updated.' }
        format.json { render :show, status: :ok, location: @recommend }
      else
        format.html { render :edit }
        format.json { render json: @recommend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recommends/1
  # DELETE /recommends/1.json
  def destroy
    @recommend.destroy
    respond_to do |format|
      format.html { redirect_to recommends_url, notice: 'Recommend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recommend
      @recommend = Recommend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recommend_params
      params.fetch(:recommend, {})
    end
end
