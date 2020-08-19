class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :name, :agency, :sex, :age])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password, :name, :agency, :sex, :age])
  end

  def after_sign_in_path_for(resource)
    if current_casting_agent
      pages_casting_agent_home_path
    else current_actor
      pages_actor_home_path
    end
  end

  def after_sign_out_path_for(scope)
    '/'
  end

  def current_user
    @current_user = current_casting_agent || current_actor
  end

  def authenticate!
    if @current_user == current_casting_agent
      :authenticate_casting_agent!
    elsif @current_user == current_actor
      :authenticate_actor!
    end
  end

end
