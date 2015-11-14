class CommentsController < ApplicationController
	
	def index
		id=params[:concertnet_id]
		@concert = Concertnet.find_by(id: id)   #Gives me the concert associated to an specific id.
		@comment = @concert.comments.new    #Creates a new comment for a concert.
		@comments=Comment.where(concertnet_id: id)  #Give me list of the comments
		# @comments=Comment.order(created_at: :asc)   #Order on ascending order. Last created is show at the end				 
		@date = Date.today  
		render 'index'
	end

	def create
		@concert = Concertnet.find_by(id: params[:concertnet_id])
		comment=@concert.comments.new(comment_params)

		if comment.save
			redirect_to action: "index",controller: "comments"
			
		else
			render 'index' 
		end 
	end

	private

	def comment_params
		params.require(:comment).permit(:comment)  #Create a project with attributes name and description
	end
end
