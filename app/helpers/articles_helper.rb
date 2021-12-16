module ArticlesHelper
  def require_profile
    if user_signed_in? && current_user.first_name.nil?
      flash[:error] = "Vous devez enregistrer votre profil"
      redirect_to edit_profile_path(current_user.id)
    end
  end
end
