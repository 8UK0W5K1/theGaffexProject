class Keyword < ApplicationRecord
  has_many :keyword_to_articles, dependent: :destroy
  has_many :keywords, through: :keyword_to_articles

  def self.assign_keywords(params, article)
    params[:tags].join.split(';').each do |keyword|
      @keyword = Keyword.new(name: keyword)
      if @keyword.save
        KeywordToArticle.create(article: article, keyword: @keyword)
      else
        KeywordToArticle.create(article: article, keyword: Keyword.find_by(name: keyword))
      end
    end
  end
end
