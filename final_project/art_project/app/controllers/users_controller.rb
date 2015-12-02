class UsersController < ApplicationController

	#Nobody(except the loged user) can have access to the list of users
	# before_action :authenticate_user!

	 def index
	 	@users=User.all
	 end


	#Create and New action for admin's controller
	# def new
	# 	@user=User.new
	# end

	# def create
	# 	@user = User.new(user_params)

	#     respond_to do |format|
	#       if @user.save
	#         format.html { redirect_to @user, notice: 'User was successfully created.' }
	#         format.json { render :show, status: :created, location: @user }
	#       else
	#         format.html { render :new }
	#         format.json { render json: @user.errors, status: :unprocessable_entity }
	#       end
	#     end
	# end

	# def show
	# 	@user=User.find_by(id: params[:id])
	# end

	#I'm going to use this part on the admin's controller
	#  def destroy
	#  	user=User.find_by(id: params[:id])
	#  	user.destroy
	#     respond_to do |format|
	#       format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
	#       format.json { head :no_content }
	#     end
 # end

end

