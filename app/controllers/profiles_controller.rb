class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:first_name].blank? || params[:last_name].blank? 
      flash.now[:alert] = 'Erreur, vous devez remplir les champs'
      render :edit
    elsif params[:first_name].length  >= 50 || params[:last_name].length >= 50
      flash.now[:alert] = "Désolé, maximum 50 caractères pour ces champs"
      render :edit
    else
      @user.update(first_name: params[:first_name].capitalize, last_name: params[:last_name].upcase)
      @user.avatar.attach(params[:avatar]) unless params[:avatar].nil?
      redirect_to stored_location_for(:user)
    end 
  end

  def destroy
    User.find(params[:id]).destroy
    if current_user.admin
      flash[:info] = "Le profil a bien été supprimé !"
      redirect_to root_path
    else
      flash[:info] = "Votre profil a bien été supprimé !"
      redirect_to root_path
    end   
  end

end


