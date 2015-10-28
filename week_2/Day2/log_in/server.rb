require 'sinatra'
require "sinatra/reloader" if development?
require "./lib/user_login.rb"
require "pry"

enable(:sessions)  #Save the state of your page

get "/login" do
	erb(:login_page)
end

post "/profile" do
	@username=params[:userName]
	@password=params[:password]
	login_user = Login.new(@username, @password)
	@user_login=login_user.is_valid?
	
	if @user_login
		
		if session[:user]==nil
			session[:user]=@username
		else
			session[:user]=@username
		end
		@user=session[:user]

		erb(:profile_user)
	else
		redirect'/login'  #send me to login page again
	end
end

post "/logout" do    #The name of the logout form in profile_user
	session[:user]=nil
	redirect'/login'
end
