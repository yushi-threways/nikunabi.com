class CreateMenuBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_books do |t|
      t.references :shop, foreign_key: true
      t.string :images

    end
  end
end
