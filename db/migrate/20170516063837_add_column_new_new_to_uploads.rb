class AddColumnNewNewToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :map_id, :integer
  end
end
