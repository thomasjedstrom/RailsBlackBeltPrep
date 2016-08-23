class Event < ActiveRecord::Base
	belongs_to :user
	belongs_to :state
	has_and_belongs_to_many :users

	validates :name, :date, :location, :state, presence: true
end
