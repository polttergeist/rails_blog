class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception
    #skip_forgery_protection
 		helper_method :current_user, :logged_in?
 		around_action :handle_request
    #before_action :authenticate_user!

 	def handle_request
 		req = RequestHandler.new(remote_ip: request.remote_ip, request_method: request.method, request_url: request.url)
		# binding.irb
		yield
 		req.response_status = response.status
 		req.response_content_type = response.content_type.nil? ? "none" : response.content_type
 		req.save
 	end
end