class PostsController < ApplicationController
	
	def index
		@list_Posts=Post.all
	end
	def new
		@post=Post.new
	end

	def create
		@post=Post.new(post_params)
		if @post.save
			#Add a sesion that expires automatically. Id is removed after been access
			#User id is saved on the flash
			flash[:@post]=@post.id
			#Redirect to list of posts
			redirect_to posts_path
		else
			render 'new'
		end
	end
	
	def show
	end

	def delete
		@post.destroy
		
	end

	private
	def post_params
		params.require(:post).permit(:title,:content)
	end
end
