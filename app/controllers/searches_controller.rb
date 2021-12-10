class SearchesController < ApplicationController
  include SearchesHelper

  def index
    @keyword = params[:keyword]
    @results = search(params)
  end
end
