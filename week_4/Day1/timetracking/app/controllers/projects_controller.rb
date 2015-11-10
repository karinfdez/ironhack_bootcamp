class ProjectsController < ApplicationController
	def index
		@projects=Project.order(created_at: :desc)   #Order on descending order. Last created is first to show
						 .limit(10)
		render 'index'
	end

	def show
		#variable that contains the user number(project id)
		id=params[:id]
		@proj=Project.find_by(id: id)  #Returns nil if isn't there the id

		if @proj ==nil
			redirect_to("/404")
		else	
			render 'show'
		end
	end
end
