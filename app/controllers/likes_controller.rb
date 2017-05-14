class LikesController < ApplicationController

  def create
    @like = Like.create(user_id: current_user.id, upload_id: params[:upload_id])
    @likes = Like.where(upload_id: params[:upload_id])
    @uploads = Upload.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, upload_id: params[:upload_id])
    like.destroy
    @likes = Like.where(upload_id: params[:upload_id])
    @uploads = Upload.all
  end

end
