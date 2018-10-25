class CreateDetailScenes < ActiveRecord::Migration[5.2]
  def change
    create_table :detail_scenes do |t|
      t.references :detail, foreign_key: true
      t.references :scene, foreign_key: true

    end
  end
end
