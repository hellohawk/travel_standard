class UploadsController < ApplicationController
  autocomplete :search, :city , :full => true
  before_action :move_to_index, except: :index

  def index
     @uploads = Upload.includes(:user).page(params[:page]).per(5).order("created_at DESC")
      gon.region = "001"
      gon.resolution = "continents"
      gon.data = [["region_name","region_code"]] + Map.where(pre_resolutions:gon.region).pluck(:regions_name,:regions)
  end

  def new
    @upload = Upload.new
  end

  def create
      Upload.create(image: upload_params[:image], comment: upload_params[:comment], user_id: current_user.id)
  end

  def destroy
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

  def search
      gon.region = params[:region]
      # if integer_string?(gon.region) then
      #   if gon.region.length < 3 then
      #     gon.region = (3-gon.region.length)*"0" + gon.region
      #   end
      # end
      gon.resolution = params[:resolution]
      gon.data = [["region_code","region_name"]] + Map.where(pre_resolutions:gon.region).pluck(:regions_name,:regions)
      @uploads = Upload.includes(:user).page(params[:page]).per(5).order("created_at DESC")
      render :action => "index"
    # ここにモデルからもらったparameterを使用する
  end

  # def autocomplete_upload_comment
  #   term = params[:term]
  #   binding.pry
  #   uploads = Upload.scope_name(term)
  #   render json: uploads.map { |upload| { id: upload.id, label: upload.method_name, value: upload.method_name } }
  # end

  def integer_string?(str)
    Integer(str)
    true
  rescue ArgumentError
    false
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
