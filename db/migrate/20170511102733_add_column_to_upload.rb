class AddColumnToUpload < ActiveRecord::Migration
  def change
    add_column :uploads, :search_id, :integer
  end
end
