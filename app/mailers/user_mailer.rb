class UserMailer < ApplicationMailer
  default from: 'gaffex.dev@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://the-gaffex-project.herokuapp.com/users/sign_in'
    mail(to: @user.email, subjet: 'bienvenue sur Gaffex !')
  end
end
