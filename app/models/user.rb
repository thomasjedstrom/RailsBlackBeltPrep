class User < ActiveRecord::Base
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	
	has_secure_password

	has_many :events, dependent: :destroy
	has_many :discussions
	has_and_belongs_to_many :events
	belongs_to :state


	validates :first_name, :last_name, :email, :city, :state_id, presence: true
	validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }

	validates :password, :confirmation => true, :length => { minimum: 8 }, :on => :create
	
	before_save do
		self.email.downcase!
	end
end
