class AddColumnToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :name, :string, null: false, default: ""
    add_column :shops, :description, :string, null: false, default: ""
    add_column :shops, :telNumber, :string, null: false, default: ""
  end
end
