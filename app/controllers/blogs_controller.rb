class BlogsController < ApplicationController
  before_action :set_blog, only: [:show]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all.order(created_at: :desc) 
  end

  def show
    @otherblogs = Blog.where.not(id: set_blog).order("RAND()").limit(4)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :subtitle, :content, :image, :secondtitle, :secondsubtitle, :secondcontent, :secondimage)
    end
end
