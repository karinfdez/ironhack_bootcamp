class UsersController < ApplicationController

	#Nobody(except the loged user) can have access to the list of users
	# before_action :authenticate_user!

	 def index

	 	@users=User.all
	 end

end

