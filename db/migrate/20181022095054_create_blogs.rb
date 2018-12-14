class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.references :admin, foreign_key: true
      t.string :title
      t.string :subtitle
      t.text   :content
      t.string :image

      t.timestamps
    end
    add_index :blogs, [:admin_id, :created_at]
  end
end
