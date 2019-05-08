class ApplicationController < ActionController::Base
	before_action :setup

	def get_notification
    	flash["message"]
  	end 

  	def set_notification(message)
   		flash["message"] = message
  	end

	private

	def log_in_user(user_id)
		session[:user_id] = user_id
	end

	def log_out_user
	  	session[:user_id] = nil
	end

	def setup
		@logged_in = !!session[:user_id]

		if @logged_in
			@logged_in_user_id = session[:user_id]
    		@logged_in_user = User.find(@logged_in_user_id)
	  		# @logged_in_user = User.find(session[:id])

		end

	end
end
