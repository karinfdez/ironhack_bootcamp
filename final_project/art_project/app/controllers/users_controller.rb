class UsersController < ApplicationController

	def new
		user = User.find_by_email(params[:user][:email])
		@valid_email=user.valid_password?(params[:user][:password])
	end
end
