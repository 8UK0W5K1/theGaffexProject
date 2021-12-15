class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user= current_user
  end

  def update
    @user= current_user
    if params[:first_name].nil? || params[:last_name].nil?
      flash.now[:alert] = 'Erreur, vous devez remplir les champs'
      render :edit
    else
      @user.update(first_name: params[:first_name], last_name: params[:last_name])
      redirect_to stored_location_for(:user)
    end
  end
end


