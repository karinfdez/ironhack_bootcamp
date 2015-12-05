class CommentsController < ApplicationController

   before_filter(:load_post)

  def index
    @comments=@post.comments.all
  end

  def create
    @comment = @post.comments.create(comment_params)
    redirect_to 'users/@user.id/posts/@post_user.id'
    # post_comments(@post)
  end
 
  private
    def load_post
      @post = Post.find(params[:post_id])
    end
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end

