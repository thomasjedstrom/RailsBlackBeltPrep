class State < ActiveRecord::Base
	def state_initials
		"#{initials}"
	end
end
