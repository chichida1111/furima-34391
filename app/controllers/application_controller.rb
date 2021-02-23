class ApplicationController < ActionController::Base
  before_action :basic_auth

  praivate

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'cktest' && password == 'ck696969'
    end
  end
end
