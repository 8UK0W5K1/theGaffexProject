class UsersController < ApplicationController

  before_action :authenticate_user!

  def edit
    @user= current_user
  end

  def update
    @user= current_user
    if params[:first_name] == "" || params[:last_name] == ""
      flash.now[:alert] = 'Erreur, vous devez remplir les champs'
      render :edit
    else
      @user.update(first_name: params[:first_name], last_name: params[:last_name])
      redirect_to root_path
    end
 
  end
  
end


