class AddUploadIdToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :upload_id, :integer
  end
end
