class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  after_action :handle_request

  def handle_request
    req = RequestLog.new(remote_ip: request.remote_ip, request_method: request.method, request_url: request.url, response_status: response.status)
    req.response_content_type = response.content_type.nil? ? "none" : response.content_type
    req.save
  end
end
