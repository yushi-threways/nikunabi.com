class AddColumnToAddress < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :shop, foreign_key: true
      t.references :city, foreign_key: true
      t.references :area, foreign_key: true
      t.string :zipcode
      t.string :prefecture, default: '愛知県'
      t.string :street
      t.float :latitude
      t.float :longitude
      t.string :full_address
      t.string :station

      t.timestamps
    end
    add_index :addresses, [:shop_id, :created_at]
  end
end
