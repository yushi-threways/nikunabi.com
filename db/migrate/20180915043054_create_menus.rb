class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.references :shop, foreign_key: true
      t.string :name, null: false
      t.string :image
      t.string :price, null: false
      t.string :quantity
      t.string :bake
      t.string :taste
      t.string :comment

      t.timestamps
    end
    add_index :menus, [ :shop_id, :created_at ]
  end
end
