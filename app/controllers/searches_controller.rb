class SearchesController < ApplicationController
  include SearchesHelper

  def index
    @keyword = params[:keyword]
    @page = if params[:page].nil? || params[:page].to_i.zero?
              1
            else
              params[:page].to_i
            end

    @results = search(params)[((@page - 1) * 6)..(@page * 6 - 1)]
    respond_to do |format|
      format.html { render :index }
      format.js
    end
  end
end
