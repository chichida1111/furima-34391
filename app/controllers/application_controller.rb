class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :last_name_j, :family_name_j, :last_name_k, :family_name_k, :birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'cktest' && password == 'ck696969'
    end
  end
end
