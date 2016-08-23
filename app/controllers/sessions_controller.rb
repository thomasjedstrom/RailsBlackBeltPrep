class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to events_path
		else
			flash[:errors] = ["Invalid combination"]
			redirect_to new_sessions_path
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to root_path
	end
end
