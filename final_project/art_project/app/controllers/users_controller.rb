class UsersController < ApplicationController

	#Nobody(except the loged user) can have access to the list of users
# before_action :authenticate_user!

	 def index
	 	@users=User.all

	 	if @user.nil?
	 		"There isn't users on the system"
	 	else
	 		render 'index'
	 	end

	 end

	 def show
	 	@user=User.find_by(id: params[:id])
	 	
	 	if @user.nil?
	 		redirect_to '/404'
	 	else
	 		render 'show'
	 	end
	 end

end

