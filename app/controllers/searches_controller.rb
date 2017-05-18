class SearchesController < ApplicationController


  def index
    # Search.destroy_all
  end

  def import
    Search.import(params[:file])
    redirect_to "/search"
  end

end
