class UploadsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
     @uploads = Upload.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @upload = Upload.new
  end

  def create
      Upload.create(image: upload_params[:image], comment: upload_params[:comment], user_id: current_user.id)
      # @like = Like.create(user_id: current_user.id, upload_id: params[:upload_id])
      # @likes = Like.where(upload_id: params[:upload_id])
  end

  def destroy
      like = Like.find_by(user_id: current_user.id, upload_id: params[:upload_id])
    like.destroy
      @likes = Like.where(upload_id: params[:upload_id])
      upload = Upload.find(params[:id])
      upload.destroy if upload.user_id == current_user.id
  end

  def edit
      @upload = Upload.find(params[:id])
  end

  def update
      upload = Upload.find(params[:id])
      upload.update(upload_params) if upload.user_id == current_user.id
  end

  def show
      @upload = Upload.find(params[:id])
      @comments = @upload.comments.includes(:user)
  end

  private
    def upload_params
      params.permit(:image, :comment)
      # params.require(:upload).permit(:image,:comment)
    end

    def correct_user
      @upload = current_user.uploads.find_by(id: params[:id])
      redirect_to user_pictures_path(current_user) if @upload.nil?
    end

    def move_to_index
      redirect_to action: "index" unless user_signed_in?
    end
  end
