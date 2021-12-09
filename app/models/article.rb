class Article < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy

  has_one_attached :picture

  validates :title, :summary, :introduction, :protocol, :result, :conclusion, :references, presence: true
  validates :title, length: { minimum: 5, maximum: 140 }

  def self.search(keyword)
    Article.all.select do |article|
      article.match_article(keyword) ||
        article.user.first_name.include?(keyword) ||
        article.user.last_name.include?(keyword)
    end
  end

  def match_article(keyword)
    true if title.include?(keyword) ||
      summary.include?(keyword) ||
      introduction.include?(keyword) ||
      protocol.include?(keyword) ||
      result.include?(keyword) ||
      conclusion.include?(keyword) ||
      references.include?(keyword)
  end

  def short_summary
    short_summary = ''
    word_array = summary.split('')
    120.times do |index|
      break if word_array[index].nil?

      short_summary += word_array[index]
    end
    short_summary += ' ... '
  end
end
