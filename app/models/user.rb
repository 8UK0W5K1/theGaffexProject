class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  has_many :articles, dependent: :destroy
  has_many :tags, dependent: :destroy

  after_create :welcome_send

  private

  def welcome_send
    UserMailer.welcome_email(self)
  end
end
