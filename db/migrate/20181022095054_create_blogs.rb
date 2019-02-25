class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.references :admin, foreign_key: true
      t.string :main_title
      t.string :title_01
      t.string :title_02
      t.string :title_03
      t.string :title_04
      t.text   :main_content
      t.text   :content_01
      t.text   :content_02
      t.text   :content_03
      t.text   :content_04
      t.string :main_image
      t.string :image_01
      t.string :image_02
      t.string :image_03
      t.string :image_04

      t.timestamps
    end
    add_index :blogs, [:admin_id, :created_at]
  end
end
