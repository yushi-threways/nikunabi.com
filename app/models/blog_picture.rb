class BlogPicture < ApplicationRecord
  belongs_to :blog
  mount_uploaders :images, BlogImageUploader

  # def self.create_picture_by(blog_picture_params)

  #     return false if blog_picture_params[:images].nil?
    
  #     BlogPicture.transaction do 
        
  #     blog_picture_params[:images].each do |picture|
  #         new_picture = BlogPicture.new(images: picture)
  #         return false unless new_picture.save!
  #       end
  #     end
  #     true
  #   end
end
