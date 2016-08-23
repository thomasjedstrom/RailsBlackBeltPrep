class EventsController < ApplicationController
	before_action :require_login

	def index
		@events_in_state = Event.where(state_id: current_user.state_id)
		@events_out_state = Event.where.not(state_id: current_user.state_id)
	end

	def show
		@event = Event.find(params[:id])
		@discussion = Discussion.where(event: @event)
	end

	def create
		puts params
		event = Event.new(event_params)
		event.user = current_user
		if event.save
			current_user.events.push(event)
			redirect_to events_path
		else
			flash[:event_errors] = event.errors.full_messages
			redirect_to events_path
		end
	end   

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(event_params)
			redirect_to events_path
		else
			flash[:edit_errors] = @event.errors.full_messages
			redirect_to :back
		end
	end

	def destroy
		Event.destroy(params[:id])
		redirect_to events_path
	end

	private
	def event_params
		params.require(:event).permit(:name, :date, :location, :state_id)
	end
end
