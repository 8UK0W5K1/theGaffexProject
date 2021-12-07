class Article < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy

  has_one_attached :picture

  validates :title, :summary, :introduction, :protocol, :result, :conclusion, :references, presence: true
  validates :title, length: { minimum: 5, maximum: 140 }


  def   short_summary
    short_summary = ""
    word_array = self.summary.split("")
    70.times do |index|
      short_summary += word_array[index]
    end
    short_summary +=  " ... "
    short_summary
  end
end
