class MapsController < ApplicationController
  def index
    # Map.destroy_all
  end

  def import
    Map.import(params[:file])
    redirect_to "/maps"
  end
end
