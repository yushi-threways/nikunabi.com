class CreateShopRecommends < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_recommends do |t|
      t.references :shop, foreign_key: true
      t.references :recommend, foreign_key: true

    end
  end
end
