class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.references :admin, foreign_key: true
      t.string :title
      t.string :content

      t.timestamps
    end
    add_index :information, [ :admin_id, :created_at ]
  end
end
