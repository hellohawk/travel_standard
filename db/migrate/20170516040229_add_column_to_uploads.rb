class AddColumnToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :continent,  :string
    add_column :uploads, :subcontinent,      :string
    add_column :uploads, :country, :string
    add_column :uploads, :city,   :string
  end
end
