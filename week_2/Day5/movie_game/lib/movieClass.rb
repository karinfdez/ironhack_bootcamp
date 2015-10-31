class Movie

	def initialize(movie)
		@search = Imdb::Search.new(movie)
		@twentyMovies=@search.movies[0,20]
		@images=[]
	end
	

	def find_movie
	   
		@twentyMovies.each do |hm| 
		if !hm.poster.nil? && !hm.rating.nil?  && !hm.director.nil? && !hm.year.nil? 
					@images.push(hm) 
		    end 
		end 
		@images[0,9]
	end

	def select_movie(number)
		
    	nineImages=find_movie
    	arrayData=[]
    	case number.to_i
		
		when 1   #movie's director
			    nineImages.each do |hm|
    			 arrayData.push(hm.director)
    	    end
    	when 2   #movie's year
    		    nineImages.each do |hm|
    			 arrayData.push(hm.year)
    	    end
    	when 3  #movie's rating
    		  nineImages.each do |hm|
    			arrayData.push(hm.rating)
    	    end
    	end
    	arrayData
	end
end