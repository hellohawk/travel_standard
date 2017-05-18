class UploadsController < ApplicationController
  autocomplete :search, :city , :full => true
  before_action :move_to_new, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
     # @uploads = Upload.includes(:user).page(params[:page]).per(5).order("created_at DESC")
     @uploads = Upload.all[1..100]
      gon.region = "001"
      gon.resolution = "continents"
      gon.data = [["region_name","region_code"]] + Map.where(pre_resolutions:gon.region).pluck(:regions_name,:regions)
  end

  def new
    ajax_action unless params[:country].blank?

    @upload = Upload.new
    a = 0
    if params[:continent] != nil then
      a = 1
    end
    if params[:subcontinent] != nil then
      a = 1
    end

    if a == 0  then
      @continents = make_select_option(Map.where(resolutions:"continents"))
      @subcontinents = make_select_option(Map.where(resolutions:"subcontinents"))
      @countries = make_select_option(Map.where(resolutions:"country"))
    end
  end

  def ajax_action
      # @@country = params[:country]
      @cities = make_select_option_for_cities(Map.where(pre_resolutions:params[:country]))
      render :json => @cities
  end


  def create
      @upload = Upload.new(image: params[:image], continent:params[:continent], subcontinent: params[:subcontinent], country: params[:country], city: params[:city], user_id: current_user.id)

      respond_to do |format|
        if @upload.save
          format.html { redirect_to @upload, notice: 'Item was successfully created.' }
          format.json { render :show, status: :created, location: @upload }
        else
          format.html { render :new }
          format.json { render json: @upload.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy
    binding.pry
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
    ajax_action unless params[:country].blank?

    a = 0
    if params[:continent] != nil then
      a = 1
    end
    if params[:subcontinent] != nil then
      a = 1
    end

    if a == 0  then
      @continents = make_select_option(Map.where(resolutions:"continents"))
      @subcontinents = make_select_option(Map.where(resolutions:"subcontinents"))
      @countries = make_select_option(Map.where(resolutions:"country"))
    end
  end

  def update
    @upload = Upload.new(id:params[:id],image: params[:image], continent:params[:continent], subcontinent: params[:subcontinent], country: params[:country], city: params[:city], user_id: current_user.id)

binding.pry

    respond_to do |format|
      if @upload.update
        format.html { redirect_to @upload, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def search
      gon.region = params[:region]
      gon.resolution = params[:resolution]
      gon.data = [["region_code","region_name"]] + Map.where(pre_resolutions:gon.region).pluck(:regions_name,:regions)

      if gon.resolution == "subcontinents" then
        @uploads = Upload.where(subcontinent:gon.region).order("likes_count")
      elsif gon.resolution == "country" then
        @uploads = Upload.where(country:gon.region).order("likes_count")
      elsif gon.resolution == "city" then
        @uploads = Upload.where(country:gon.region).order("likes_count")
      end

      if @uploads.length >100 then
        @uploads = @uploads[0..99]
      end

      # @uploads = Upload.includes(:user).page(params[:page]).per(5).order("created_at DESC")
      render :action => "index"
  end

  def integer_string?(str)
    Integer(str)
    true
  rescue ArgumentError
    false
  end

  def make_select_option(datas)
    if datas.size !=0 then
      box = [["下記から選択","",{"selected":"selected"}]]
      datas.each do |data|
          box = box + [[data[:regions_name],data[:regions],{"data-val":data[:pre_resolutions]}]]
      end
    else
      box = ""
    end
    return box
  end

  def make_select_option_for_cities(datas)
    if datas.size !=0 then
      box = [{label:"nothing",value:"nothing"}]
      datas.each do |data|
          box = box + [{label:data[:regions_name],value:data[:regions]}]
      end
    else
      box = ""
    end
    return box
  end

  def autocomplete_search_city
    term = params[:term]
    searches = Search.where("city like '%" + term + "%'")
    render json: searches.map { |search| { id: search.id, label: search.city, value: search.city_code } }
  end

  private
    def upload_params
      params.permit(:image, :continent, :subcontinent, :country ,:city)
      # params.require(:upload).permit(:image,:comment)
    end

    def correct_user
      @upload = current_user.uploads.find_by(id: params[:id])
      redirect_to user_pictures_path(current_user) if @upload.nil?
    end

    def move_to_new
      redirect_to action: "new" unless user_signed_in?
    end
  end
