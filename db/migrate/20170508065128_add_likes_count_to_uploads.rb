class AddLikesCountToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :likes_count, :integer
  end
end
