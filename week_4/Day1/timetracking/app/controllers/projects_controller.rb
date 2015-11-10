class ProjectsController < ApplicationController
	def index
		@projects=Project.order(created_at: :desc)   #Order on descending order. Last created is first to show
						 .limit(10)
		render 'index'
	end
end
