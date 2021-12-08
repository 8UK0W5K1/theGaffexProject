class ArticlesController < ApplicationController
  def index
    @articles = Article.all.reverse
  end

  def show
    @article = Article.find(params[:id])
  end
end
