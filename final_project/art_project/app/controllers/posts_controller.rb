class PostsController < ApplicationController
	
	def index
		#Show all posts by descendant order(last, shows first)
		@list_Posts= Post.order("id DESC").all

 		respond_to do |format|
    		format.html  # index.html.erb
    		format.json  { render :json => @list_Posts }
    	end
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
		id=params[:id]
		@post=Post.find_by(id: id)
		if @post==nil
			redirect_to('/404')
		else
			render 'show'
		end

	end

	def edit
		@post=Post.find_by(id: params[:id])
		if @post==nil
			redirect_to('/404')
		else
   		  # if @post.update(post_params)
      	# 	 redirect_to posts_path
    	  # else
      	# 	render 'edit'
    	  # end
    	respond_to do |format|
      		if @post.update(post_params)
        		format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        		format.json { render :show, status: :ok, location: @post }
      		else
        		format.html { render :edit }
        		format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
       end	
       
	end

	def delete
		@post.destroy

	end

	private
	
	def post_params
		params.require(:post).permit(:title, :content)
	end
end
