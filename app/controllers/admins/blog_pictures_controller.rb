class Admins::BlogPicturesController < Admins::ApplicationController
  layout "admins"

  def index
    @blog_picture = BlogPicture.all
  end
 
  def show
    @blog_picture = BlogPicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog_picture }
    end
  end

 
  def new
    @blog_picture = BlogPicture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog_picture }
    end
  end

  def edit
    @blog_picture = BlogPicture.find(params[:id])
  end


  def create
    @blog_picture = BlogPicture.new(blog_picture_params)
  
    respond_to do |format|
      if @blog_picture.save
        format.html { redirect_to admins_blog_picture_path, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @blog_picture = BlogPicture.find(params[:id])

    respond_to do |format|
      if @blog_picture.update_attributes(blog_picture_params)
        format.html { redirect_to [:admins, @blog_picture], notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog_picture.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @blog_picture = BlogPicture.find(params[:id])
    @blog_picture.destroy

    respond_to do |format|
      format.html { redirect_to admins_blog_pictures_url }
      format.json { head :no_content }
    end
  end

  private
  def blog_picture_params
    params.require(:blog_picture).permit( {images: []} )
  end
end

