class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :masquerade_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username fullname])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username fullname photo coverimage])
  end
end
