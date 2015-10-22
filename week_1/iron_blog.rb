require 'pry'
class Blog 
	attr_accessor :items_page,:actual_page,:total_pages,:arg1,:arg2

	def initialize(post_array,items_page)
		@items_page=items_page
		@actual_page=1
		@items_page=items_page
		items_float=items_page.to_f
		@total_pages=(post_array.length/items_float).ceil
		@arg1=0
		@arg2=@items_page-1
		@user_input=""

		@new_array=post_array.sort do |post1,post2| #If I put array.sort! I can change the original array without putting it inside a variable
			post2.date <=> post1.date
		end
	end

	def publish_front_page
		@new_array[arg1..arg2].each do |hm|
			hm.print_post
	    end
	    footer_page(@actual_page)
	    
    end

    def footer_page(actual_page)
    	
    	
    	if is_first_page?    #Blog is on page 1
    		puts " \n\n EXIT   NEXT > "
			 		
    	
    	elsif is_last_page? #I'm on last page
				puts " \n\n < PREVIOUS  EXIT"
				
		else
			puts " \n\n < PREVIOUS   EXIT   NEXT > "
				
    		
    	end	
    	user_input=gets.chomp
		user_input=user_input.downcase
       	
    	if user_input=="next" && user_input!="exit"
    		next_page
   
    	elsif user_input=="previous" && user_input!="exit"
    	    prev_page

    	end

    end


    def is_last_page?
		@actual_page >= total_pages
	end

	def is_first_page?
		@actual_page == 1
	end

	def prev_page
	    
			if !is_first_page?
				@actual_page-= 1
				@arg1-=items_page
				@arg2=@arg1+(@items_page-1)
				publish_front_page
			
			elsif 
				publish_front_page
			end	
    end
	
	def next_page
		
			if !is_last_page?
				@actual_page+= 1
				@arg1+=items_page
				@arg2=@arg1+(@items_page-1)
				publish_front_page
		    
		    else
		    	publish_front_page

	        end  
	end
end


class Post
	attr_accessor :title, :text, :date,:sponsor
	
	def initialize(title, date,text,sponsor)
		@title=title
		@date=date
		@text=text
		@sponsor=sponsor
	end

	def print_post
		if sponsor=="sponsored"
			frontpage= 
					  "\n\n***#{title}***  #{date}\n"+
					   "-"* title.length+
						"\n#{text}\n"	
					
					  puts frontpage
		else 
			frontpage=
					  "\n\n#{title}  #{date}\n"+
					  "-"* title.length+   #Prints "-" with a size of title
					  "\n#{text}\n"	
					  
					  puts frontpage	

	    end
    end
    
end

post1_time=Time.new(2015,10,25,12,45,18)
post1=Post.new("Welcome to Miami",post1_time,"Miami is the Sunchine state","sponsored")
post2_time=Time.new(2015,10,19,21,18,0)
post2=Post.new("San Franciso is the best place to live",post2_time,"There is no place like San Francisco.","post")
post3_time=Time.new(2015,10,26,9,24,16)
post3=Post.new("Best arquitecture?",post3_time,"I visited New York on winter!.","sponsored")
post4_time=Time.new(2015,10,26,9,24,18)	
post4=Post.new("This is a test",post4_time,"Who likes tests?","post")
post5_time=Time.new(2015,10,24,9,24,18)	
post5=Post.new("Have You done?",post5_time,"Almost finishing!!!!","post")
array_post=[post1,post2,post3,post4,post5]
karins_blog =Blog.new(array_post,3) #Array of post(first arg). Amount of post per page(2nd argument)
karins_blog.publish_front_page

