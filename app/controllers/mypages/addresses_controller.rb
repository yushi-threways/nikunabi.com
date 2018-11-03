class Mypages::AddressesController < Mypages::ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  layout "users", only: [:index, :show, :edit, :new]


  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
    @shop = @address.shop
  end

  # GET /addresses/new
  def new
    @address = Address.new
    @shop = set_shop
  end

  # GET /addresses/1/edit
  def edit
    @shop = set_shop
    @address = set_address
  end


  # POST /addresses
  # POST /addresses.json
  def create
    @shop = Shop.find(params[:shop_id])
    @address = @shop.build_address(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to [:mypages, @address], notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to [:mypages, @address], notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    def set_shop
      @shop = Shop.where(:id => params[:shop_id]).first
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      #@user = User.find(params[:id])
      @user = User.where(:id => params[:user_id]).first
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:shop_id, :zipcode, :street, :building, :station)
    end
end
