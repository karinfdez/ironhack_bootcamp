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
		@entr=@proj.entries.new
		render("new")
	end

	def create
		id=params[:project_id]
		@proj=Project.find_by(id: id)
		@entr=@proj.entries.new(entry_params)   #method passed as parameter)
		if @entr.save
			redirect_to action: "index",controller: "entries", project_id: @proj.id
			# redirect_to("/projects/#{@proj.id}/entries")
	   else
	   	 render 'new'  #Send me to the form again
	   end

		#show the new page
		#show errors
	end

	private
	#Always rails reuqire this method to avoid malicious input
	def entry_params
		params.require(:entry).permit(:hours,:minutes,:date)
	end

end
