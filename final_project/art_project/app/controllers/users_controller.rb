class UsersController < ApplicationController

  # Avoid people to visit page without been log in. Only are public home and index pages.
  # before_action :authenticate_user!, except: ["home","index"]

  def home
    # @name = current_user ? @current_user.username : "User"
    if current_user.nil?
     @name='Ironhacker'
  else
     @name=current_user.username
  end
  end

  def index
    @users=User.order('username DESC').all
  end

  def new
    @user=User.new
  end

 # receives form and creates a user from that data
  def create
     @user = User.new(user_params)
    if @user.save
      # log_in @user
      # flash[:success] = "Welcome to the Sample App!"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
   
   @user=User.find_by(id: params[:id])
    if @user==nil
      redirect_to('/404')
    else
      render 'show'
    end

  end


  def edit
    @user=User.find_by(id: params[:id])

    if @user==nil
      redirect_to('/404')
    else
          render 'edit'
        end 
       
  end


  private
  
  def user_params
  	params.require(:user).permit(:username,:email,:password,:password_confirmation)
  end
end
