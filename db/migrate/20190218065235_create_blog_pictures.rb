class CreateBlogPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_pictures do |t|
      t.references :blog, foreign_key: true
      t.json :images

      t.timestamps
    end
  end
end
