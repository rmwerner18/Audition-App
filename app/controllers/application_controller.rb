class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # def configure_permitted_parameters
  #   added_attrs = [:username, :email, :password, :password_confirmation]
  #   devise_parameter_sanitizer.permit(:signup, keys: [added_attrs, :name, :agency])
  #   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :name, :agency, :sex, :age])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password, :name, :agency, :sex, :age])
  end
end
