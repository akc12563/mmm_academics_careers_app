class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:photo, :first_name, :last_name, :grad_year, :industry_focus, :prior_company, :prior_industry, :prior_location, :prior_position, :ok_to_invite, :ok_to_contact])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:photo, :first_name, :last_name, :grad_year, :industry_focus, :prior_company, :prior_industry, :prior_location, :prior_position, :ok_to_invite, :ok_to_contact])
  end
end
