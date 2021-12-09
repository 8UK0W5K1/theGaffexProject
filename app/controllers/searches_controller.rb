class SearchesController < ApplicationController
  include SearchesHelper

  def index
    @results = search(params)
  end
end
