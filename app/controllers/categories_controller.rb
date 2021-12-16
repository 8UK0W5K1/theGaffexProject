class CategoriesController < ApplicationController
  def show
    @page = if params[:page].nil? || params[:page].to_i.zero?
              1
            else
              params[:page].to_i
            end

    @category = Category.find(params[:id])
    @articles = Article.where(category: @category).order("updated_at DESC").limit(60 + (@page * 6))
    @total_pages = (@articles.count / 6.to_f).ceil
    @articles = @articles[((@page - 1) * 6)..(@page * 6 - 1)]
    @articles = nil if @articles == []
    respond_to do |format|
      format.html { render :show }
      format.js
    end
  end
end
