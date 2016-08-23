class UsersController < ApplicationController
	before_action :require_login, except: [:create]
	before_action :require_correct_user, only: [:edit, :update, :destroy,]

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to events_path
		else
			puts user.errors.full_messages
			flash[:reg_errors] = user.errors.full_messages
			redirect_to root_path
		end		
	end

	def join
		event = Event.find(params[:id])
		current_user.events.push(event)
		redirect_to :back
	end

	def cancel
		event = Event.find(params[:id])
		current_user.events.delete(event)
		redirect_to :back
	end

	def edit
		@user = current_user
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(update_params)
			redirect_to events_path
		else
			flash[:edit_errors] = @user.errors.full_messages
			redirect_to :back
		end
	end

	def destroy
	end

	def show
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :city, :state_id, :password, :password_confirmation)
	end
	def update_params
		params.require(:user).permit(:first_name, :last_name, :email, :city, :state_id)
	end
end
