class SearchesController < ApplicationController
  include SearchesHelper

  def index
    @keyword = params[:keyword]
    @page = if params[:page].nil? || params[:page].to_i.zero?
              1
            else
              params[:page].to_i
            end

    @results = Search.new(params[:keyword]).results
    @results_count = @results.count
    @total_pages = (@results_count / 6.to_f).ceil
    @results = @results[((@page - 1) * 6)..(@page * 6 - 1)]
    respond_to do |format|
      format.html { render :index }
      format.js
    end
  end
end
