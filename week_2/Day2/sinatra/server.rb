require "sinatra"

get "/" do 
	
	"My first Sinatra app."
end

get "/hi" do 
	
	"Hello World"
end

get "/about" do
	bday=Time.new(1986,8,6)
	now=Time.now
	@years_ago=now.year-bday.year
	erb(:author)  
end

get "/home" do 
	
	"Hello World"
	erb(:home)
end

get "/users/:username" do
	@name=params[:username]   
	erb(:user_profile)
end

get "/hours/ago/:time" do
	@input_hour=params[:time].to_i
	hours=@input_hour*3600  #in second
	@difTime=Time.now-hours
	erb(:time)  
end



