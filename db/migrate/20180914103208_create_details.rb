class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.references :shop, foreign_key: true
      t.string :image
      t.string :open, null: false
      t.string :holiday, null: false
      t.string :access, null: false
      t.string :parking, null: false
      t.string :concept
      t.string :account
      t.string :payment
      t.string :facility
      t.string :light
      t.string :vibe
      t.integer :party
      t.string :smoking

      t.timestamps
    end
    add_index :details, [:shop_id, :created_at]
  end
end
