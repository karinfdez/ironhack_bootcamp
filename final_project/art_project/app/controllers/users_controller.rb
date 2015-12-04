class UsersController < ApplicationController

 
#Throw an exception if unauthorized user is trying to access this pages.
  #Like an log in user but when not admin preferences.
 # load_and_authorize_resource
  
  #Authenticate user when trying to edit, create or modify users(if it's not log in).
  before_action :authenticate_user!,except: :index 
   #Apply this method for this actions.
  before_action :set_user, only: [:show, :edit, :destroy]

  before_filter :is_admin_user, only: [:index]

	def index
		@users=User.all
		if @user.nil?
	 		"There is not user on the database"
	 	else
	 		render 'index'
	 	end

	end

	def new
		@user=User.new
	end
	
	def create
		@user = User.new(user_params)

	    respond_to do |format|
	      if @user.save
	        format.html { redirect_to @user, notice: 'User was successfully created.' }
	        format.json { render :show, status: :created, location: @user }
	      else
	        format.html { render :new }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def show
		@user=set_user
		# @user=User.find_by(id: params[:id])
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
	def set_user
	    if @user.nil?
        	redirect_to '/404'
      	else
            @user = User.find(params[:id])
        end
	end
end










	 # def index
	 # 	@users=User.all

	 # 	if @user.nil?
	 # 		"There aren't users on the system"
	 # 	else
	 # 		render 'index'
	 # 	end

	 # end

	 # def show
	 # 	@user=User.find_by(id: params[:id])
	 	
	 # 	if @user.nil?
	 # 		redirect_to '/404'
	 # 	else
	 # 		render 'show'
	 # 	end
	 # end

# end

