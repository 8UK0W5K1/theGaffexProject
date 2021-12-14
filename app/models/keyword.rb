class Keyword < ApplicationRecord
  has_many :keyword_to_articles, dependent: :destroy
  has_many :keywords, through: :keyword_to_articles
end
