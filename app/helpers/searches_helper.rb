module SearchesHelper
  def search(params)
    keyword = params[:keyword]
    results = []
    # the & operator allows you to run some action only if the before action runs successfully
    Article.search(keyword)&.each { |article| results << article }
    results
  end
end
