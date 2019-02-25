class Admins::BlogsController < Admins::ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  layout "admins"

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @bolg = set_blog
  end

  # GET /blogs/new
  def new
      @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = current_admin.blogs.build(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to [:admins, @blog], notice: '新しいブログを投稿しました。' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to [:admins, @blog], notice: 'ブログを編集しました。' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    flash.notice = 'ブログを削除しました。'
    redirect_to :admins_blogs
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(
        :main_title, :main_content, :main_image, :main_image_cache, :remove_main_image, 
        :title_01, :content_01, :image_01, :image_01_cache, :remove_main_01, 
        :title_02, :content_02, :image_02, :image_02_cache, :remove_main_02, 
        :title_03, :content_03, :image_03, :image_03_cache, :remove_main_03, 
        :title_04, :content_04, :image_04, :image_04_cache, :remove_main_04 
      )
    end
end
