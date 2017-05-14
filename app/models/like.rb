class Like < ActiveRecord::Base
  belongs_to :upload, counter_cache: :likes_count
  belongs_to :user
end
