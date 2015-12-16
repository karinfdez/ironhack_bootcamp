class EntriesController < ApplicationController
	def index
		id=params[:project_id]
		@proj=Project.find_by(id: id)
		
		if @proj==nil
			redirect_to("/404")
		else
			@entr=@proj.entries
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
			flash[:notice] = "Entry was created successfully"
      		redirect_to("/projects/#{@proj.id}/entries")
	   else
	   	 render 'new'  #Send me to the form again
	   end
	end

	def edit
		id=params[:project_id]
		@proj=Project.find_by(id: id)
		my_entr_id=params[:id]

		if(@proj==nil)
			redirect_to("/404")
		else
			@entr = @proj.entries.find_by(id: my_entr_id)
			
			if @entr==nil
				redirect_to("/404")
			else	
				render ("edit")
	        end
	    end
	end


	def update

	 	id=params[:project_id]
		@proj=Project.find_by(id: id)
		id_entry=params[:id]
		@entr=@proj.entries.find_by(id: id_entry)
	

		if @entr==nil
			redirect_to ("/404")
		else
			if @entr.update(entry_params)
				flash[:notice] = "Entry was edited successfully" 
     			redirect_to "/projects/#{@proj.id}/entries"
     		else
     			render "edit"
     		end
		end	
	 end

	def destroy
	 	id=params[:project_id]
		@proj=Project.find_by(id: id)
		id_entry=params[:id]
		@entr=@proj.entries.find_by(id: id_entry)

		
		if @entr==nil
			redirect_to ("/404")
		else
		  @entr.destroy
		  redirect_to "/projects/#{@project_id}/entries"
		  
		end

	 end


	private
	#Always rails require this method to avoid malicious input
	def entry_params
		params.require(:entry).permit(:hours,:minutes,:date)
	end

end
