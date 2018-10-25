class CreateDetailRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :detail_rooms do |t|
      t.references :detail, foreign_key: true
      t.references :room, foreign_key: true

    end
  end
end
