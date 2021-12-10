class Article < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy

  has_one_attached :picture

  validates :title, :summary, :introduction, :protocol, :result, :conclusion, :references, presence: true
  validates :title, length: { minimum: 5, maximum: 140 }

  def self.search(keyword)
    results = []
    Article.match_article(keyword).each { |result| results << result }
    Article.match_user(keyword).each { |result| results << result }
    results
  end

  def self.match_article(keyword)
    Article.where('title ILIKE ?', "%#{keyword}%").or(
      Article.where('summary ILIKE ?', "%#{keyword}%").or(
        Article.where('introduction ILIKE ?', "%#{keyword}%").or(
          Article.where('protocol ILIKE ?', "%#{keyword}%").or(
            Article.where('result ILIKE ?', "%#{keyword}%").or(
              Article.where('conclusion ILIKE ?', "%#{keyword}%")
            )
          )
        )
      )
    )
  end

  def self.match_user(keyword)
    Article.where(user: User.where('first_name ILIKE ?', "%#{keyword}%").or(
      User.where('last_name ILIKE ?', "%#{keyword}%").or(
        User.where('first_name ILIKE ? AND last_name ILIKE ?', "%#{keyword.split(' ')[0]}%", 
"%#{keyword.split(' ')[1]}%")
      )
    ))
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

  def attach_picture(params)
    if params[:picture].nil?
      picture.attach(io: File.open('./app/assets/images/default_picture.jpg'), filename: 'default.jpg')
    else
      picture.attach(params[:picture])
    end

  end
end
