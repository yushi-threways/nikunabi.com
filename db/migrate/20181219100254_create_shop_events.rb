class CreateShopEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_events do |t|
      t.references :shop, foreign_key: true
      t.string :title
      t.text :content
      t.string :image
      t.date :closed_at
      t.date :published_at
      t.boolean :published, default: false

      t.timestamps
    end
    add_index :shop_events, [ :shop_id, :created_at ]
  end
end
