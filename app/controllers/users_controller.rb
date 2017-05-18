class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @uploads = user.uploads.page(params[:page]).order("likes_count")
    @count   = @uploads.length
  end

end
