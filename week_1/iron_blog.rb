class Blog
	attr_accessor :post_array

	def initialize(post_array)
		@post_array=post_array  #takes the array of posts
	end

	def publish_front_page 
		
		new_array=post_array.sort do |post1,post2| #If I put array.sort! I can change the original array without putting it inside a variable
			post2.date <=> post1.date
		end
		

		new_array.each do |hm|
			
			if hm.sponsor=="sponsored"

					puts "\n\n"
					puts  "********#{hm.title}******"
					puts "--------------------"
					puts "#{hm.text}"	
			
			elsif hm.sponsor =="post"
				puts "\n\n"
					puts  "#{hm.title}"
					puts "--------------------"
					puts "#{hm.text}"	
			else
				puts "\n\n"
				puts "Article's title: #{hm.title} needs to be fill with 'sponsored' or 'post' categories. "
			end
		end
	end
end

	# def create_frontpage
	
	# 	puts "\n\n"
	# 		puts  "#{title}"
	# 		puts "--------------------"
	# 		puts "#{text}"	
	# end


class Post
	attr_accessor :title, :text, :date,:sponsor
	def initialize(title, date,text,sponsor)
		@title=title
		@date=date
		@text=text
		@sponsor=sponsor
	end
	
end

# class Time
# 	attr_accessor :year,:month, :day, :hours,:minutes, :seconds
# 	def initialize(year,month,day,hours,minutes,seconds)
# 		@year=year
# 		@month=month
# 		@day=day
# 		@minutes=minutes
# 		@seconds=seconds
# 	end

# 	def <=> (other_time)
# 		 <=> 
# 	end

# 	def create_time
# 		Time.new(year, month, day, hours, minutes,seconds)
# 	end
# end

def create_array(array,post)
	array.push(post)
end

post1_time=Time.new(2015,10,25,12,45,18)
post1=Post.new("Welcome to Miami",post1_time,"Miami is the Sunchine state","sponsored")
post2_time=Time.new(2015,10,19,21,18,0)
post2=Post.new("San Franciso is the best place to live",post2_time,"There is no place like San Francisco."+	" People there is amazing.","post")
post3_time=Time.new(2015,10,26,9,24,16)
post3=Post.new("Best arquitecture ever?.New York defenitely is",post3_time,"I visited New York on winter...."+" One of the most incredibles experiences ever!","sponsored")
post4_time=Time.new(2015,10,26,9,24,18)	
post4=Post.new("This is a test",post4_time,"Who likes tests?","post")
post5_time=Time.new(2015,10,24,9,24,18)	
post5=Post.new("Have You done?",post5_time,"Almost finishing!!!!","lulu")
															
post_array=[]
create_array(post_array,post1)
create_array(post_array,post2)
create_array(post_array,post3)
create_array(post_array,post4)
create_array(post_array,post5)

first_blog=Blog.new(post_array)
first_blog.publish_front_page


