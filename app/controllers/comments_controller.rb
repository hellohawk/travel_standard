class CommentsController < ApplicationController

  def create
    Comment.create(text: params[:text], upload_id: params[:upload_id], user_id: current_user.id)
    redirect_to "/uploads/#{@comment.upload.id}"
  end

  private
    def comment_params
      params.permit(:text, :upload_id)
    end

end
