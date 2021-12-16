class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  validates :first_name, length: { maximum: 50 }
  validates :last_name, length: { maximum: 50 }

  has_many :articles, dependent: :destroy
  has_many :tags, dependent: :destroy

  after_create :welcome_send
  after_create :attach_default_avatar

  private

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def attach_default_avatar
    # used hardcoded path because i couldn't fiond any way to use the asset pipeline to generate the right path for the
    # images, I watched the doc files for asset pipeline and active storage and a lot of stack overflow, neither of them gave me
    # even clues on how to do this
    avatar.attach(io: File.open('./app/assets/images/default_avatar.png'), filename: 'default.png')
  end
end
