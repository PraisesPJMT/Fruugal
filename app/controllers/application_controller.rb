class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:splash]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password])
  end

  private

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
end
