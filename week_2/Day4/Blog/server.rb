require 'sinatra'
require "sinatra/reloader" if development?
require "./lib/postClass.rb"
require "./lib/blogClass.rb"
enable(:sessions)  #Save the state of your page

@post1=Post.new("Welcome to Miami","Miami is the Sunchine state","sponsored")
@post2=Post.new("San Franciso is the best place to live","There is no place like San Francisco.","post")
@post3=Post.new("Best arquitecture?","I visited New York on winter!.","sponsored")	
@post4=Post.new("This is a test","Who likes tests?","post")
@array_post=[@post1,@post2,@post3,@post4]
blog=Blog.new(@array_post,3)

get "/post_titles" do
	@sorted_blog = blog.get_latest_posts
	erb(:posts)
end

get '/post_details/:id' do
	@index=(params[:id].to_i)-1
	@sorted_blog=blog.get_latest_posts[@index]
	erb(:post_details)
end

get "/new_post?" do
	erb(:create_post)
end

 post '/user_input' do
 	
end
