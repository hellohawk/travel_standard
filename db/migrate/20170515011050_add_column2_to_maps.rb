class AddColumn2ToMaps < ActiveRecord::Migration
  def change
    add_column :maps, :pre_resolutions,      :string
  end
end
