class CreatePrides < ActiveRecord::Migration[5.2]
  def change
    create_table :prides do |t|
      t.references :shop, foreign_key: true
      t.string :image
      t.string :title
      t.string :content

      t.timestamps
    end
    add_index :prides, [:shop_id, :created_at]
  end
end
