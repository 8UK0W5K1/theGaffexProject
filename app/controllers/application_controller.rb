class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :store_location!,
                unless: lambda {
                  devise_controller? ||
                    request.xhr? ||
                    (controller_name == 'profiles' && action_name == 'edit') ||
                    (controller_name == 'article' && action_name == 'destroy')
                },
                if: -> { request.get? && is_navigational_format? }
end
