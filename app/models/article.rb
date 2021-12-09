class Article < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy

  has_one_attached :picture

  validates :title, :summary, :introduction, :protocol, :result, :conclusion, :references, presence: true
  validates :title, length: { minimum: 5, maximum: 140 }

  def self.search(keyword)
    Article.all.select do |article|
      article.title.include?(keyword) ||
        article.summary.include?(keyword) ||
        article.introduction.include?(keyword) ||
        article.protocol.include?(keyword) ||
        article.result.include?(keyword) ||
        article.conclusion.include?(keyword) ||
        article.references.include?(keyword) ||
        article.user.first_name.include?(keyword) ||
        article.user.last_name.include?(keyword)
    end
  end

  def   short_summary
    short_summary = ""
    word_array = self.summary.split("")
    120.times do |index|
      if word_array[index] == nil
        break
      end
      short_summary += word_array[index]
    end
    short_summary +=  " ... "
  end
end
