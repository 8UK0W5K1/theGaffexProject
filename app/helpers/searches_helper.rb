module SearchesHelper
  def search(params)
    keyword = params[:keyword]
    Article.search(keyword)
  end
end
