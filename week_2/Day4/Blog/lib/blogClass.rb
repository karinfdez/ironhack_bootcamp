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
		@post_array=post_array
		# @new_array=[]
		
	end

	def get_latest_posts
		
		new_array=@post_array.sort do |post1,post2| #If I put array.sort! I can change the original array without putting it inside a variable
			post2.date <=> post1.date
		end
		new_array
		
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
