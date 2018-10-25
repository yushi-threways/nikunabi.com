class CreateShopFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_features do |t|
      t.references :shop, foreign_key: true
      t.references :feature, foreign_key: true

    end
  end
end
