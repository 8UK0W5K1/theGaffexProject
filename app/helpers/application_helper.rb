module ApplicationHelper
  def tag_count(article)
    number_approved = article.tags.where(tag_name: "Approved").length
    number_not_approved = article.tags.where(tag_name: "Not Approved").length
    number_need_review = article.tags.where(tag_name: "Need Review").length

    tag_count = { approved: number_approved, not_approved: number_not_approved, need_review: number_need_review }
  end

  def whith_tag(user, article)
    tag = article.tags.find_by(user: user)
    if tag != nil
      return tag[:tag_name]
    else
      return nil
    end
  end

  def categories
    Category.all
  end

  def require_profile
    if user_signed_in?
      if current_user.first_name.nil?
        flash[:error] = "Vous devez enregistrer votre profil"
        redirect_to edit_profile_path(current_user.id)
      end
    end
  end
  
end
