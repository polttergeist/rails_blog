class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception
 	helper_method :current_user, :logged_in?
 	around_action :handle_request
	
	def current_user
     	@current_user ||= User.find(session[:user_id]) if session[:user_id]
   	end
	
	def logged_in?
     	!!current_user
 	end
	
	def require_user
    	if !logged_in?
     		flash[:danger] = "You must be logged in to perform that action"
     		redirect_to root_path
    	end
 	end

 	def handle_request
 		req = RequestHandler.new(remote_ip: request.remote_ip, request_method: request.method, request_url: request.url)
		# binding.irb
		yield
 		req.response_status = response.status
 		req.response_content_type = response.content_type.nil? ? "none" : response.content_type
 		req.save
 	end
end