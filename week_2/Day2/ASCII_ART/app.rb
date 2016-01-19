require 'sinatra'
require 'artii'

get '/ascii/:text/?:font?' do
	#If user doesn't define font, by default use shadow.
	params[:font]='shadow' if params[:font].nil?
	a = Artii::Base.new :font => params[:font]
	@text=a.asciify(params[:text])
	erb :home
end

get '/ascii/hamster/special/secret/' do
	erb :hamster
end


