class CommentsController < ApplicationController

   before_filter(:load_user,:load_post)

  def index
    @comments=@post.comments.all
  end

  def create
    @comment = @post.comments.create(comment_params)
    #this is the page where are all the comments of a post.
    redirect_to post_comments(@post)
  end
 
  private
    def load_user

    end
    def load_post
      @post = Post.find(params[:post_id])
    end
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end

