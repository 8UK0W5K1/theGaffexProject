class Article < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy

  has_one_attached :picture

  validates :title, :summary, :introduction, :protocol, :result, :conclusion, :references, presence: true
  validates :title, length: { minimum: 5, maximum: 140 }

  def self.search(keyword)
    # TODO voir pour matcher les resultats en splittant les keywords
    # TODO trier les resultats par pertinence (score d epertinence = nombre de mot presents dans le resultat + espace
    # TODO entre les mots, eg: recherche de Chuck Norris sortira en premier  "je suis chuck norris"
    # TODO puis "moi chuck super norris le bg et enfin "hello i'm chuck"")
    Article.all.select do |article|
      article.match_article(keyword) ||
        article.match_user(keyword)
    end
  end

  def match_article(keyword)
    true if title.match?(/#{keyword}/i) ||
      summary.match?(/#{keyword}/i) ||
      introduction.match?(/#{keyword}/i) ||
      protocol.match?(/#{keyword}/i) ||
      result.match?(/#{keyword}/i) ||
      conclusion.match?(/#{keyword}/i) ||
      references.match?(/#{keyword}/i)
  end

  def match_user(keyword)
    true if user.first_name.match?(/#{keyword}/i) ||
      user.last_name.match?(/#{keyword}/i) ||
      "#{user.first_name} #{user.last_name}".match?(/#{keyword}/i)
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
