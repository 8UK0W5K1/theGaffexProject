class ArticlesController < ApplicationController
  before_action :require_profile, only:[:new]
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
        render pdf: "#{@article.user.first_name} #{@article.user.last_name} - #{@article.title}", template: "articles/show.html.erb",  layout: "pdf"  # Excluding ".pdf" extension.
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

    Keyword.assign_keywords(params, @article)

  end 

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(title: params[:title], summary: params[:summary], introduction: params[:introduction], protocol: params[:protocol], result: params[:result], conclusion: params[:conclusion], references: params[:references])
    redirect_to profile_path(current_user.id)
   
  end

  def destroy
    Article.find(params[:id]).destroy
    flash[:info] = "Votre article a bien été supprimé !"
    redirect_to profile_path(current_user.id)    
  end

  private

  def require_profile
    if user_signed_in?
      if current_user.first_name.nil?
        flash[:error] = "Vous devez enregistrer votre profil"
        redirect_to edit_profile_path(current_user.id)
      end
    end
  end
end
