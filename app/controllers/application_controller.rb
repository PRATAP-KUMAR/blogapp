class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user!, unless: :api_route

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_token!, only: :api_route

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password photo bio])
  end

  def api_route
    request.path.start_with?('/api')
  end
end
