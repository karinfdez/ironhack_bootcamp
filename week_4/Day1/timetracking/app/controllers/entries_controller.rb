class EntriesController < ApplicationController
	def index
		id=params[:project_id]
		@proj=Project.find_by(id: id)
		

		if @proj==nil
			redirect_to("/404")
		else
			@entries=@proj.entries
			render ("index")
		end
	end

	def new
		id=params[:project_id]
		@proj=Project.find_by(id: id)
		@entry=@proj.entries.new
		render("new")
	end
end
