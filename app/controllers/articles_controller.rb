class ArticlesController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def index
    @page = if params[:page].nil? || params[:page].to_i.zero?
              1
            else
              params[:page].to_i
            end

    @articles = Article.all.reverse[((@page - 1) * 6)..(@page * 6 - 1)]
    @articles = nil if @articles == []
    respond_to do |format|
      format.html { render :index }
      format.js
    end
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
    if @article.save
      redirect_to root_path, notice: "Bravo Doc' !"
    else
      flash.now[:alert] = "Tous les champs sont obligatoires"
      render :action => 'new'
    end

  end

end
