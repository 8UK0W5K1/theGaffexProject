class Article < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy

  validates_presence_of :title, :introduction, :protocol, :result, :conclusion, :references
  validates :title, length: { minimum: 5, maximum: 140 }
end
