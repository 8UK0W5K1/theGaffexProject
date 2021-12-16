class Search
  attr_accessor :results, :search_input

  def initialize(search_input)
    return if search_input.nil?

    @results = []
    @search_input = search_input

    match_keywords
    match_article_head
    match_article_body
    match_user
    match_category
    filter_results
  end

  def match_keywords
    @search_input.split(' ').each do |keyword|
      KeywordToArticle.where(keyword: Keyword.find_by('name ILIKE ?', "%#{keyword}%")).find_each do |key_to_art|
        @results << key_to_art.article
      end
    end
  end

  def match_article_head
    Article.where('title ILIKE ?', "%#{@search_input}%").find_each do |article|
      @results << article
    end
    Article.where('summary ILIKE ?', "%#{@search_input}%").find_each do |article|
      @results << article
    end
    Article.where('introduction ILIKE ?', "%#{@search_input}%").find_each do |article|
      @results << article
    end
  end

  def match_article_body
    Article.where('protocol ILIKE ?', "%#{@search_input}%").find_each do |article|
      @results << article
    end
    Article.where('result ILIKE ?', "%#{@search_input}%").find_each do |article|
      @results << article
    end
    Article.where('conclusion ILIKE ?', "%#{@search_input}%").find_each do |article|
      @results << article
    end
  end

  def match_user
    @search_input.split(' ').each do |keyword|
      Article.where(user: User.where('first_name ILIKE ?', "%#{keyword}%")).find_each do |article|
        @results << article
      end
      Article.where(user: User.where('last_name ILIKE ?', "%#{keyword}%")).find_each do |article|
        @results << article
      end
    end
  end

  def match_category
    @search_input.split(' ').each do |keyword|
      Article.where(category: Category.where('name ILIKE ?', "%#{keyword}")).find_each do |article|
        @results << article
      end
    end
  end

  def filter_results
    filtered_results = []
    @results.group_by { |e| e }.map { |key, value| [key, value.size] }.each do |filtered|
      filtered_results << filtered[0]
    end
    @results = filtered_results
  end
end
