class Shops::MenuBooksController < Shops::ApplicationController
  before_action :set_menu_book, only: [:edit, :update, :destroy]
  layout "users", only: [:index, :show, :edit, :new]

  # GET /menu_books
  # GET /menu_books.json
  def index
    @menu_books = MenuBook.all
  end

  # GET /menu_books/1
  # GET /menu_books/1.json
  def show
  end

  # GET /menu_books/new
  def new
    @menu_book = MenuBook.new
  end

  # GET /menu_books/1/edit
  def edit
  end

  # POST /menu_books
  # POST /menu_books.json
  def create
    @menu_book = MenuBook.new
    @menu_book = current_shop.menu_books.build(menu_book_params)
    respond_to do |format|
      if @menu_book.save
        format.html { redirect_to [:shops, @menu_book], notice: 'メニュー表の写真を追加しました。' }
        format.json { render :show, status: :created, location: @menu_book }
      else
        format.html { render :new }
        format.json { render json: @menu_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_books/1
  # PATCH/PUT /menu_books/1.json
  def update
    respond_to do |format|
      if @menu_book.update(menu_book_params)
        format.html { redirect_to [:mypages, @menu_book], notice: 'メニュー表の写真を更新しました。' }
        format.json { render :show, status: :ok, location: @menu_book }
      else
        format.html { render :edit }
        format.json { render json: @menu_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_books/1
  # DELETE /menu_books/1.json
  def destroy
    @menu_book.destroy
    respond_to do |format|
      format.html { redirect_to menu_books_url, notice: 'Menu book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_book
      @menu_book = MenuBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_book_params
      params.require(:menu_book).permit(:images)
    end
end
