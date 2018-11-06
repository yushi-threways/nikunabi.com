class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.references :admin, foreign_key: true
      t.string :title
      t.string :secondtitle
      t.string :subtitle
      t.string :secondsubtitle
      t.text   :content
      t.text   :secondcontent
      t.string :image
      t.string :secondimage

      t.timestamps
    end
    add_index :blogs, [:admin_id, :created_at]
  end
end
