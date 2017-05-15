class AddColumnToMaps < ActiveRecord::Migration
  def change
    add_column :maps, :resolutions,  :string
    add_column :maps, :regions,      :string
    add_column :maps, :regions_name, :string
    add_column :maps, :infomation,   :string
  end
end
