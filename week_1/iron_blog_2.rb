class Post
	attr_accessor :title, :date, :text,:current_page
	def initialize(title,date,text)
		@title=title
		@date=date
		@text=text
	end

	def print_post
		puts @title
		puts "*"*@title.length
		puts @text
		puts "-"*@title.length
	end
end

class SponsoredPost < Post 
	
	def print_post
		puts "***Sponsored Post ***"
   #Calls the method from the Post class(inheritance)
		super
	end
end

class Blog

	def initialize
		@posts=[]
		#Page where blog begins
		@first_page=1
		#Current page starts at 1.
		@current_page=@first_page
		#The total posts / by the amount posts by page(rounded to the max number)
	end


	def total_pages
		(@posts.length/3.0).ceil
	end

	def add_posts(posts)
		@posts.push(posts)
	end

	def next_page
		#Add 1 to current page if I'm not in the last one
		#(while last_page is false, add 1 every time I call this method)
		unless last_page?
			@current_page += 1
		end
		publish_front_page
	end

	def prev_page
		#while first_page=false, reduce by one @current page
		unless first_page?
			@current_page -= 1
		end
		publish_front_page
	end

	def first_page?
		@first_page==1
	end
	def last_page?

		@current_page==total_pages
	end
	
	def publish_front_page
		
		sorted_posts=@posts.sort {|x,y| y.date<=>x.date}
		#If I'm in page 1, so then first page starts at position 0(to use it in the array)
		first = (@current_page - 1) * 3
		last = (@current_page * 3) - 1
		sorted_posts[first..last].each do | post | 
			post.print_post
		end
		
	  #Show at the end of the page the amount of pages
		
		for i in (1..total_pages)
			if i==@current_page
				print "[#{i.to_s}] "
			else
   			print i.to_s+" " 
   		end
		end
  end
end


post1=Post.new("title1",Time.new(2016, 01, 31),"Hello")
post2=Post.new("title2",Time.new(2016, 02, 18),"Goodbye")
post3=Post.new("title3",Time.new(2016,01,10),"Heyyyyyy")
post4=Post.new("title4",Time.new(2016, 03, 20),"Nooooooo")
post5=SponsoredPost.new("title5",Time.new(2016, 02, 02),"Hello!!!")
blog=Blog.new
blog.add_posts(post1)
blog.add_posts(post2)
blog.add_posts(post3)
blog.add_posts(post4)
blog.add_posts(post5)
blog.publish_front_page

input = ""
while input != "exit"
	puts "next for next page, prev for previous page, exit to exit"
	input = gets.chomp

	if input.downcase == "next"
		#Bonus: clear the terminal before publishing, only see the posts you selected
		system "clear" or system "cls"
	  	blog.next_page
	elsif input == "prev"
		system "clear" or system "cls"
	  blog.prev_page
	elsif input != "exit"
		puts "Command not recognized"
	end
end