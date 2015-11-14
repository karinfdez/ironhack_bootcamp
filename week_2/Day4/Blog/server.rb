require 'sinatra'
require "sinatra/reloader" if development?
require "./lib/postClass.rb"
require "./lib/blogClass.rb"
enable(:sessions)  #Save the state of your page

@post1=Post.new("Welcome to Miami","Miami is the Sunchine state")
@post2=Post.new("San Franciso is the best place to live","There is no place like San Francisco.")
@post3=Post.new("Best arquitecture?","I visited New York on winter!.")	
@post4=Post.new("This is a test","Who likes tests?")
blog=Blog.new
blog.add_post(@post1)
blog.add_post(@post2)
blog.add_post(@post3)
blog.add_post(@post4)

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

post "/new_post" do
	title=params[:title]
	text=params[:text]
	@userPost=Post.new(title,text)
	@array=blog.add_post(@userPost)
	erb(:create_post)
end

