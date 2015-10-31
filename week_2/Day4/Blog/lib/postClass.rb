require 'date'

class Post
	attr_accessor :title, :text, :date,:sponsor
	
	def initialize(title,text,sponsor)
		@title=title
		@date=Time.now
		@text=text
		@sponsor=sponsor
	end
	
	def print_post
		if @sponsor=="sponsored"
			frontpage= 
					  "\n\n***#{title}***  #{date}\n"+
					   "-"* @title.length+
						"\n#{text}\n"	
					
					  puts frontpage
		else 
			frontpage=
					  "\n\n#{title}  #{date}\n"+
					  "-"* @title.length+   #Prints "-" with a size of title
					  "\n#{text}\n"	
					  
					  puts frontpage	

	    end
    end
    
end



