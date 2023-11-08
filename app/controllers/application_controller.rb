class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?

    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name, :sex, :encrypted_password, :prefectures, :family, :identification_status, :is_active])
  end

end
