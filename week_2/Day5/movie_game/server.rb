require 'sinatra'
require 'sinatra/reloader'   #To reload page
require 'imdb'
require_relative 'lib/movieClass.rb'

enable(:sessions)

get '/' do
	erb(:find_movie)
end

post '/movie' do

	@movieWord=params[:movieFinder] 
	movieClass=Movie.new(@movieWord)
	@nineImages=movieClass.find_movie
	@numberQuestion=params[:randomQuestion]  #number of questions(input box)
	arrayData=movieClass.select_movie(@numberQuestion)
	# session[:search_term] = @movieWord  
	if arrayData.empty?
		redirect '/' #What I want here is that if user enter something different than 1,2 or 3
				     #the input inbox stay blank but the upper input box remains with the movie name?
    else
	  @randomQuestion=arrayData.sample   #from the list selected, takes a random value of the array
    end
    erb(:movie_searcher)
end

get '/questions' do
	erb(:questions)
end


