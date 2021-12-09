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

  def new; end

  def create
    @user = current_user 
    @article = Article.create(
      user: @user, title: params[:title], summary: params[:summary], introduction: params[:introduction], protocol: params[:protocol], result: params[:result], conclusion: params[:conclusion], references: params[:references]
    )
    redirect_to root_path
  end

end
