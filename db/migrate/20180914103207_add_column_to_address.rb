class AddColumnToAddress < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :shop, foreign_key: true
      t.string :street
      t.string :zipcode
      t.string :building
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
    add_index :addresses, [:shop_id, :created_at]
  end
end
