class ArticlesController < ApplicationController
  include ArticlesHelper

  before_action :require_profile, only: [:new]
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
        render pdf: "#{@article.user.first_name} #{@article.user.last_name} - #{@article.title}", template: "articles/show.html.erb", layout: "pdf" # Excluding ".pdf" extension.
      end
    end
  end

  def new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @user = current_user
    @article = Article.create(
      user: @user,
      title: params[:title],
      summary: params[:summary],
      introduction: params[:introduction],
      protocol: params[:protocol],
      result: params[:result],
      conclusion: params[:conclusion],
      references: params[:references],
      category: Category.find(params[:category])
    )

    if @article.save
      @article.attach_picture(params)
      redirect_to root_path, notice: "L'article à bien été ajouté"
    else
      flash.now[:alert] = "Tous les champs sont obligatoires"
      render :action => 'new'
    end

    Keyword.assign_keywords(params, @article)

  end

  def edit
    @article = Article.find(params[:id])
    @keywords = []
    @article.keywords.each { |keyword| @keywords << keyword.name }
    @categories = Category.all
  end

  def update
    @categories = Category.all
    @article = Article.find(params[:id])
    @keywords = []
    @article.keywords.each { |keyword| @keywords << keyword.name }
    if @article.update(
      title: params[:title],
      summary: params[:summary],
      introduction: params[:introduction],
      protocol: params[:protocol],
      result: params[:result],
      conclusion: params[:conclusion],
      references: params[:references],
      category: Category.find(params[:category])
    )
      @article.picture.attach(params[:picture]) unless params[:picture].nil?
      Keyword.update_keywords(params, @article)
      redirect_to profile_path(current_user.id)
    else
      flash.now[:alert] = "Aucun champs ne doit être vide"
      render :edit
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    flash[:info] = "Votre article a bien été supprimé !"
    if current_user.admin
      redirect_to root_path
    else
      redirect_to profile_path(current_user.id)
    end
  end
end
