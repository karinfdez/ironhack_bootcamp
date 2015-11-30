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
		#find_post is a method defined private
		if find_post==nil
			redirect_to('/404')
		else
			render 'show'
		end

	end

	def edit

		if find_post==nil
			redirect_to('/404')
		else
      		render 'edit'
        end	
       
	end

	def update
		if find_post==nil
			redirect_to('/404')
		else
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

	def destroy
	
		#find_post is defined on the private method find_post
		find_post.destroy
    	respond_to do |format|
      		format.html { redirect_to posts_path, notice: 'The post was successfully destroyed.' }
      		format.json { head :no_content }
        end
	end

	private
	def find_post
	  	id=params[:id]
		@post=Post.find_by(id: id)
	end
	
	def post_params
		params.require(:post).permit(:title, :content)
	end
end
