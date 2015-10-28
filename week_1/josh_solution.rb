
class Blog
	def initialize
		@posts = []
		@current_posts = []
		@page = 0
		@posts_per_page = 4
	end
	#Post Adding Logic
	#Add a post to the blog
	def add_post(post)
		@posts.push(post)
	end
​
	#Bonus stuff, just an FYI
	def add_a_bunch_of_posts(*args)
		args.each do | post |
			@posts.push(post)
		end
	end
	#End Post adding logic
	#All of the pagination logic
	def pages
	  (@posts.length / @posts_per_page).ceil
	end
​
	def is_last_page?
		@page >= (@posts.length / @posts_per_page).ceil
	end
​
	def is_first_page?
		@page == 0
	end
​
	def prev_page
		if !is_first_page?
			@page -= 1
			self.publish
		else
			self.publish
		end
	end
​
	def next_page
		if !is_last_page?
			@page += 1
			self.publish
		else
			self.publish
		end
	end
​
	def pagination_section
		(0..pages).each do | page |
			actual_page = page + 1
			if page == @page
				print "[#{actual_page}] "
			else
				print "#{actual_page} "
			end
		end
		puts "\n\n"
	end
	# End of pagination logic...maybe we should include this in a module :)
	# Start of publishing & display logic
	def display(posts)
		posts.each do | post |
			post.display_post
		end
		#print the pagination
		pagination_section
	end
​
	#Order our posts by date and return them
	def posts_ordered_by_date
		@current_posts.sort! { | post1, post2 | post1.date <=> post2.date }
	end
​
	#Take our ordered posts, order them by date, and display them.
	def publish
		first_post = @page * @posts_per_page
		last_post = first_post + @posts_per_page - 1
		@current_posts = @posts[first_post..last_post]
		display(posts_ordered_by_date)
	end
​
end
​
​
class Post
	attr_reader :date
​
	#Attributes our post class has
	def initialize(title, date, content)
		@title = title
		@date = date
		@content = content
	end
​
	#The logic of displaying a post should belong to the post
	def display_post
		puts " "
		puts "#{@title}   #{@date}"
		puts "*" * @title.length
		puts @content
		puts "-" * @content.length
		puts " "
	end
end
​
class SponsoredPost < Post
	#Lets inherit and just override the display method from our post class
	def display_post
		puts " "
		puts "********* #{@title}   #{@date} *********"
		puts "*" * @title.length
		puts @content
		puts "-" * @content.length
		puts " "
	end
end
​
#Mah blog
joshs_blog = Blog.new
#New sponsored post
sponsored_post = SponsoredPost.new("A message from our sponsors", $TODAY - 7, "Please buy our stuff...")
#Make some fake posts
first_post  = Post.new("My sweet new blog", $TODAY - 10, "This is my first post on the sweet new blog")
second_post = Post.new("Second Post", $TODAY - 9, "This is my second post on the sweet new blog")
third_post  = Post.new("Third Post", $TODAY - 8, "This is my third post on the sweet new blog")
fourth_post = Post.new("Fourth Post", $TODAY - 7, "This is my fourth post on the sweet new blog")
fifth_post = Post.new("Fifth Post", $TODAY - 6, "This is my fifth post on the sweet new blog")
sixth_post = Post.new("Sixth Post", $TODAY - 5, "This is my sixth post on the sweet new blog")
seventh_post = Post.new("Seventh Post", $TODAY - 4, "This is my seventh post on the sweet new blog")
eighth_post = Post.new("Eighth Post", $TODAY - 3, "This is my eight post on the sweet new blog")
ninth_post = Post.new("Ninth Post", $TODAY - 2, "This is my ninth post on the sweet new blog")
tenth_post = Post.new("Tenth Post", $TODAY - 1, "This is my tenth post on the sweet new blog")
#Add all of my new posts to the blog
joshs_blog.add_a_bunch_of_posts(
								first_post,
								second_post,
								third_post,
								fourth_post,
								sponsored_post,
								fifth_post,
								sixth_post,
								seventh_post,
								eighth_post,
								ninth_post,
								tenth_post)
#Kick it off
​
joshs_blog.publish
input = ""
while input != "exit"
	puts "next for next page, prev for previous page, exit to exit"
	input = gets.chomp
	if input == "next"
		#Bonus: clear the terminal before publishing, only see the posts you selected
		system "clear" or system "cls"
		joshs_blog.next_page
	elsif input == "prev"
		system "clear" or system "cls"
		joshs_blog.prev_page
	elsif input != "exit"
		puts "Command not recognized"
	end
end