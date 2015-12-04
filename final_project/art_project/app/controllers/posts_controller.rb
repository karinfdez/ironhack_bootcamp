class PostsController < ApplicationController
  
  #Posts is nested to his parent: the current user.
  # load_and_authorize_resource :through => :current_user
  # before_action :set_post, only: [:show, :edit, :update, :destroy]


  
  #Adding a private controller method to load the parent object(:user)
  before_filter(:load_user)

  before_action :authenticate_user!,except: [:index,:show]

  # GET /posts
  # GET /posts.json
  #Only show posts for the specific user
  def index
    # @user=User.find_by(id: params[:user_id])
    # if current_user.is_admin?
    #   # do this
    # else
    #   # do that
    # end
    #@user was load on before_filter on top.
     @posts = @user.posts.all
    
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    
     @post = @user.posts.find_by(id: params[:id])
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

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy

    @post = @user.children.find(params[:id])
    @post.destroy
    respond_to do |format|
      # format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.html { redirect_to user_posts_path(@user), notice: 'Post was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private

  def load_user
    @user=User.find_by(id: params[:user_id])
  end 
    # Use callbacks to share common setup or constraints between actions.
    # def set_post
    #   user=find_user
    #   @post = user.posts.all
    # end

   #  def find_user
   #    if @user.nil?
   #      redirect_to '/404'
   #    else
   #      @user=User.find_by(id: params[:id])
   #      # @user = current_user
   #    end
   # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :image, :content)
    end
end
