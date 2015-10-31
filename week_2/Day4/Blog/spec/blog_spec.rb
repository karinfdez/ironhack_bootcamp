require_relative("../lib/blogClass.rb")
require("RSpec")
require 'date'

RSpec.describe "Post" do 
	
   @post1=Post.new("Welcome to Miami","Miami is the Sunchine state","sponsored")
   @post2=Post.new("San Franciso is the best place to live","There is no place like San Francisco.","post")
   @post3=Post.new("Best arquitecture?","I visited New York on winter!.","sponsored")	
   @post4=Post.new("This is a test","Who likes tests?","post")
   @array_post=[@post1,@post2,@post3,@post4]
	
	let (:blog) {Blog.new(@array_post,3)}

    it "should return an array of posts" do
		expect(blog.get_latest_posts).to eq ([@post4,@post3,@post2,@post1])   #Verify if array was sort
	end

end


