class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

# 例外処理（/cats/100などの存在しないページで表示）
rescue_from ActiveRecord::RecordNotFound, with: :render_404
rescue_from ActionController::RoutingError, with: :render_404

def render_404
  render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
end
# ここまで。あとは各コントローラに書く

  private

def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
        admin_members_path
    else
        root_path
    end
end

  protected

  # デバイスログインの入力カラム
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name,
                                                      :sex,
                                                      :encrypted_password,
                                                      :prefectures,
                                                      :real_name,
                                                      :phone_number,
                                                      :address, :image,
                                                      :identification_status,
                                                      :is_active])
  end

end
