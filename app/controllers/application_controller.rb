class ApplicationController < ActionController::Base
  before_action :store_location!,
                unless: lambda {
                  devise_controller? ||
                    request.xhr? ||
                    (controller_name == 'profiles' && action_name == 'edit')
                },
                if: -> { request.get? && is_navigational_format? }

  protected

  def store_location!
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource_or_scope)
    if (Time.zone.now - current_user.created_at) < 20
      edit_profile_path(current_user.id)
    else
      stored_location_for(resource)
    end
  end

  def after_sign_out_path_for(resource)
    stored_location_for(resource) || request.referrer || root_path
  end
end
