class UsersController < ApplicationController

 
#Throw an exception if unauthorized user is trying to access this pages.
  #Like an log in user but when not admin preferences.
 # load_and_authorize_resource
  
 
  #Authenticate user when trying to edit, create or modify users(if it's not log in).
  #Unauthorized users only can see artists and theirs blogs.
  before_action :authenticate_user!,except: [:index,:show]
   #Apply this method for this actions.
  before_action :load_user, only: [:show, :edit, :destroy]

  # before_filter :is_admin_user, only: [:index]
  # before_filter :load_user

	def index
		
		# @admins=User.where(admin: true)
	    #Only show users that aren't admin(only the community are shown)
	    @users = User.where(admin: false)
	  
	end

	def new
		@user=User.new
	end
	
	def create
		@user = User.new(user_params)

	    respond_to do |format|
	      if @user.save
	        format.html { redirect_to '/users', notice: 'User was successfully created.' }
	        format.json { render :show, status: :created, location: @user }
	      else
	        format.html { render :new }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def show

	end

	 def destroy
	 	#user=User.find_by(id: params[:id])
	 	#user.destroy
	 	@user.destroy
	    respond_to do |format|
	      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	end

	private
	def load_user
            @user = User.find_by(id: params[:id])
            if @user.nil?
        		redirect_to '/404'
            end
	end

	def user_params
      params.require(:user).permit(:first_name, :last_name, :email,:users_description,:password, :password_confirmation)

    end
end


