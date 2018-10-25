class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :prefecturecode
      t.string :prefecture
      t.string :prefecturekana
      t.string :citycode
      t.string :city
      t.string :citykana

      t.timestamps
    end
  end
end
