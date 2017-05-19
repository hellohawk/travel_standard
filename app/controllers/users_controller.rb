class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @uploads = user.uploads.page(params[:page]).order("likes_count")

    if @uploads == nil then
      @count = 0
    else
      @count = @uploads.length
    end
  end

end
