class ProjectsController < ApplicationController
	def index
		@projects=Project.order(created_at: :desc)   #Order on descending order. Last created is first to show
						 .limit(10)
		# @projects=Project.all
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
			# render 'show',layout: 'personal_layout'   #Me carga el layout que yo cree(personal_layout.html.erb)
		end
	end

	def new #Creates new project
		render 'new'
	end

	def create
		# project=Project.new(name: params[:project][:name] ,description: [:project][:description])
		project=Project.new(project_params)
		if project.save==true
			redirect_to('/projects')
		end

	end

	def edit
	    my_id = params[:id]
	    @proj = Project.find_by(id: my_id)

	    if @proj == nil
	      redirect_to("/404")
	    else
	        render("edit")
        end
    end

    def update

	    my_proj_id = params[:id]

	    @proj = Project.find_by(id: my_proj_id)

	    if @proj == nil
	      redirect_to("/404")
	    else
	       if @proj.update_attributes(project_params)
	          redirect_to("/projects/#{@proj.id}")
	        else
	          render "edit"
	        end
	    end
    end

    def destroy

    	my_proj_id=params[:id]
    	@proj=Project.find_by(id: my_proj_id)

    	if @proj==nil
    		redirect_to("/404")
    	else
    		@proj.destroy
    		redirect_to ("/projects")
    	end
    	
    end

	private

	def project_params
		params.require(:project).permit(:name, :description)  #Create a project with attributes name and description
	end
end
