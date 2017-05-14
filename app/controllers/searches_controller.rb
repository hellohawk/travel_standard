class SearchesController < ApplicationController

    def index
        if params[:term]
            @hiragana = params[:term].tr("ア-ン","あ-ん")
            @katakana = params[:term].tr("あ-ん", "ア-ン")
            @search = Search.where("name LIKE ? OR name LIKE ?","%#{@hiragana}%","%#{@katakana}%")
        else
            @search = Search.all
        end

        respond_to do |format|
            format.html
            format.json{render:json => @search.to_json}
        end
    end
end
