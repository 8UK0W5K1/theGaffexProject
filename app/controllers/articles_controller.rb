class ArticlesController < ApplicationController
  def index
    @page = if params[:page].nil? || params[:page].to_i.zero?
              1
            else
              params[:page].to_i
            end

    @articles = Article.all.reverse[((@page - 1) * 6)..(@page * 6 - 1)]
  end

  def show
    @article = Article.find(params[:id])
  end
end
