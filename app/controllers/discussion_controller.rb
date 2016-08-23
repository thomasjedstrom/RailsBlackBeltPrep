class DiscussionController < ApplicationController
	before_action :require_login

	def create
		discussion = Discussion.new(discussion_params)
		discussion.user = current_user
		discussion.event = Event.find(params[:id])
		if discussion.save
			redirect_to '/events/' + params[:id]
		else
			flash[:dis_errors] = discussion.errors.full_messages
			redirect_to '/events/' + params[:id]
		end
	end

	private
	def discussion_params
		params.require(:discussion).permit(:content)
	end
end
