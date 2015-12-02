class UsersController < ApplicationController

before_action :authenticate_user!
 def index
 	@users=User.all
 end

 def show
 	user=User.find_by(id: params[:id])
 	render 'show'
 end

 def edit
 end

 def destroy
 	user=User.find_by(id: params[:id])
 	user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
 end

end

