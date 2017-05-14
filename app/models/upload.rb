class Upload < ActiveRecord::Base

 belongs_to :user
 default_scope -> { order(created_at: :desc) }
 mount_uploader :image, ImageUploader
 validates :user_id, presence: true

 has_many   :likes , dependent: :destroy
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end

 has_many   :comments

end
