class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :tags, dependent: :destroy
  has_many :keyword_to_articles, dependent: :destroy
  has_many :keywords, through: :keyword_to_articles

  has_one_attached :picture

  validates :title, :summary, :introduction, :protocol, :result, :conclusion, :references, presence: true
  validates :title, length: { minimum: 5, maximum: 140 }

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
      # used hardcoded path because i couldn't fiond any way to use the asset pipeline to generate the right path for the
      # images, I watched the doc files for asset pipeline and active storage and a lot of stack overflow, neither of them gave me
      # even clues on how to do this
      picture.attach(io: File.open('./app/assets/images/default_picture.jpg'), filename: 'default.jpg')
    else
      picture.attach(params[:picture])
    end
  end
end
