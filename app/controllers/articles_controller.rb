class ArticlesController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def index
    @page = if params[:page].nil? || params[:page].to_i.zero?
              1
            else
              params[:page].to_i
            end

    @articles = Article.all.order("updated_at DESC")
    @total_pages = (@articles.count / 6.to_f).ceil
    @articles = @articles[((@page - 1) * 6)..(@page * 6 - 1)]
    @articles = nil if @articles == []
    respond_to do |format|
      format.html { render :index }
      format.js
    end
  end

  def show
    @article = Article.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Article : #{@article.title}" , template: "articles/show.html.erb"  # Excluding ".pdf" extension.
      end
    end
  end

  def new; end

  def create
    @user = current_user 
    @article = Article.create(
      user: @user, title: params[:title], summary: params[:summary], introduction: params[:introduction], protocol: params[:protocol], result: params[:result], conclusion: params[:conclusion], references: params[:references]
    )

    if @article.save
      @article.attach_picture(params)
      redirect_to root_path, notice: "L'article à bien été ajouté"
    else
      flash.now[:alert] = "Tous les champs sont obligatoires"
      render :action => 'new'
    end

  end

end
