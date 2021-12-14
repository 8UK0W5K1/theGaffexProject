class Keyword < ApplicationRecord
  has_many :keyword_to_articles, dependent: :destroy
  has_many :keywords, through: :keyword_to_articles

  validates :name, presence: true

  def self.assign_keywords(params, article)
    params[:tags].join.split(';').each do |keyword|
      if Keyword.find_by(name: keyword).nil?
        @keyword = Keyword.new(name: keyword)
        KeywordToArticle.create(article: article, keyword: @keyword) if @keyword.save
      else
        KeywordToArticle.create(article: article, keyword: Keyword.find_by(name: keyword))
      end
    end
  end
end
