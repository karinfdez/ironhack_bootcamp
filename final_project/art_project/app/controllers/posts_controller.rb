class PostsController < ApplicationController
  
  #Posts is nested to his parent: the current user.
  # load_and_authorize_resource :through => :current_user
  # before_action :set_post, only: [:show, :edit, :update, :destroy]


  
  #Adding a private controller method to load the parent object(:user)
  before_filter(:load_user)

  before_action :authenticate_user!,except: [:index,:show,:index_all]

  # GET /posts
  # GET /posts.json
  #Only show posts for the specific user
  def index
    
    if @user.nil?
      @posts = Post.all
    else
      @posts = @user.posts
    end
    
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    
     @post = Post.find_by(id: params[:id]) or redirect_message

  end

  def redirect_message
    redirect_to '/404'
  end

  # GET /posts/new
  def new
    #Helper method load has the before_action method where I don't have
    #to define new post
    @post = @user.posts.new

  end

  # POST /posts
  # POST /posts.json
  def create
    #Only the loged user can create posts for himself, not any other user.
    @post = @user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to [@user,@post], notice: @user.first_name + ', the post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  # GET /posts/1/edit
  def edit
    @post = @user.posts.find(params[:id])
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update

    @post = @user.posts.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to [@user, @post], notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def index_all

     @posts = Post.order("title ASC").all
  end
    
  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy

    @post = @user.posts.find(params[:id])
    if @post.destroy
    respond_to do |format|
      format.html { redirect_to user_posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
      end
    end
  end

  private

  def load_user
    @user=User.find_by(id: params[:user_id])
  end 

  

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :image, :content)
    end
end
