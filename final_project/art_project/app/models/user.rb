class User < ActiveRecord::Base

# Makes sure password and password_confirmation match when new user is created.
	has_secure_password

	validates :password,:password_confirmation,presence: true
	validates :name,  presence: true, length: { maximum: 50 }
	
	#Only emails with this pattern will be considered valid. 
	#Is not perfect, it allows invalid addresses with consecutives dots.
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }

    #When using Devise:
    #validates_format_of :email,:with => Devise::email_regexp

end
