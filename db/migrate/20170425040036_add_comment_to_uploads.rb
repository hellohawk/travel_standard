class AddCommentToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :comment, :string
  end
end
