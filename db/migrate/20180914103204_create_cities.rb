class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.integer :citycode
      t.string :city
      t.string :citykana
    end
  end
end
